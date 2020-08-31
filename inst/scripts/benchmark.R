library(bdchecks)
library(foreach)
library(data.table)
library(tidyverse)
# library(doParallel)
# registerDoParallel(cores=5)

foo <- ls("package:bdchecks")
foo <- foo[grep("dc_",foo)]
taxize_dc <- c("dc_class_valid", "dc_family_valid", 
  "dc_genus_valid", "dc_kingdom_valid",
  "dc_order_valid", "dc_phylum_valid")
dc_list <- foo[!foo %in% taxize_dc]
dc_list <- gsub("dc_", "", dc_list)
#####################################
create_testdata <- function(
  path_datatest = system.file("extdata/data_test.yaml", package = "bdchecks"),
  wanted_dc = NULL
) {
  if (is.null(wanted_dc)) {
    wanted_dc <- names(data.checks@dc_body)
  } 
  d <- yaml::read_yaml(path_datatest)
  data_test <- list()
  for (i in seq_along(wanted_dc)) {
    idx <- which(names(d) == wanted_dc[i])
    stopifnot(length(idx) == 1)
    data_current <- d[[idx]]$data
    stopifnot(!is.null(data_current))
    stopifnot(all(c("type", "expected") %in% data_current[[1]]))
    data_test[[i]] <- do.call(
      rbind, lapply(data_current[-1], as.character)
    ) %>%
      data.frame(stringsAsFactors = FALSE)
    colnames(data_test[[i]]) <- data_current[[1]]
  }
  names(data_test) <- wanted_dc
  return(data_test)
}
try_dc <- function(wanted_dc = NULL) {
  for (i in seq_along(data_test)) {
    check <- wanted_dc
    if (!is.null(data.checks@dc_body[[check]]@input$target2)) {
      result_test <- get(paste0("dc_", check))(
        data_test[[i]][, 1],
        data_test[[i]][,  data.checks@dc_body[[check]]@input$target2]
      )
    } else {
      result_test <- get(paste0("dc_", check))(data_test[[i]][, 1])
    }
    data_test[[i]]$observed <- ifelse(
      (is.na(result_test) | result_test == FALSE),
      "fail", "pass"
    )
  }
  return(data_test)  
}
# ignore taxon checks right now, 
# possibly benchmark together with tax_available_name()
result_performance <- foreach(i = 10^(3:7), .combine = rbind) %do% {
  print(i)
  bar <- foreach(j = dc_list, .combine = rbind) %do% {
    foo <- create_testdata(wanted_dc = j)
    coef <- round(i/nrow(foo[[j]]), 0)
    data_test <- list(
      do.call("rbind", replicate(coef, foo[[j]], simplify = FALSE))
    )
    names(data_test) <- j
    foo <- foreach(k = 1:5, .combine = rbind) %do% {
      time_start <- Sys.time()
      result <- try_dc(j)[[j]]$observed
      time_end <- Sys.time()
      if (i >= 1e5 && k == 1) { 
        print(paste0(j, " in ", time_end - time_start))
      }
      data.frame(
        size = factor(i), dc = j, rep = k,
        type = data.checks@dc_body[[j]]@information$check_type,
        class = data.checks@dc_body[[j]]@information$darwin_core_class,
        performed = length(na.omit(result)),
        time = as.numeric(time_end - time_start, unit = "secs")
      )
    }
  }
}

pd <- data.table(result_performance)

ggplot(pd, aes(dc, time, fill = size)) +
  geom_bar(
    stat = "identity", position = "dodge",
    width = 0.7
  ) +
  scale_x_discrete(limits = pd[, mean(time), dc][order(V1)]$dc) +
  coord_flip() +
  #facet_wrap(~ data, ncol = 2) +
  scale_fill_brewer(palette = "Dark2") +
  labs(
    title = "bdchecks performance time",
    subtitle = "on different size of data",
    x = "Data check",
    y = "Performance time, seconds",
    fill = "Data size"
  ) +
  theme_classic() +
  theme(
    legend.position = "bottom"
  )

ggplot(pd, aes(dc, time, color = size)) +
  geom_point(alpha = 0.6) +
  #geom_line(aes(group = rep)) +
  scale_x_discrete(limits = pd[, mean(time), dc][order(V1)]$dc) +
  coord_flip() +
  scale_color_brewer(palette = "Dark2") +
  labs(
    title = "bdchecks performance time",
    subtitle = "on different size of data",
    x = "Data check",
    y = "Performance time, seconds",
    fill = "Data size"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom",
    axis.text.y = element_text(size = 11, color = "black"),
    axis.text.x = element_text(size = 13, color = "black"),
    axis.title.x= element_text(size = 17, color = "black"),
    axis.title.y= element_text(size = 17, color = "black"))


