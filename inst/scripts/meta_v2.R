############# input from bdchecks_logic google sheets ###########
foo <- read.csv('~/Desktop/c.csv')[,c(2,9:15)]
colnames(foo) <- c(
  'name', 
  '{suppressWarnings(lubridate::as_date(., format = "%Y-%m-%d"))}', 
  'as.POSIXct()', 
  'gsub(" ", "", .)', 
  '{suppressWarnings(as.numeric(.))}', 
  'trimws()', 
  'tolower()', 
  'gsub("_| |\\.|-", "", .)'
)
rownames(foo) <- gsub(" ", "_", foo$name)
foo$name <- NULL
cleaning_table <- foo
############### testing place #############################
if (is.null(wanted_dc)) {
    wanted_dc <- names(data.checks@dc_body)
}
for (i in seq_along(wanted_dc)) {
    idx <- which(names(data.checks@dc_body) == wanted_dc[i])
    stopifnot(length(idx) == 1)
    dc <- data.checks@dc_body[[idx]]

    target_names <- gsub(" ", "", dc@input$target)
    target_names <- unlist(strsplit(target_names, ","))
    target_result <- vector("list", length(target_names))
    names(target_result) <- target_names
    for (j in target_names) {
      if (!j %in% colnames(data)) {
        warning(
          "Column ", j, " does not exist in a given dataset;",
          " skipping data check ", dc@name, " for it."
        )
        target_result[[j]] <- rep(NA, nrow(data))
      } else {
      #   if (!is.null(dc@input$target2)) {
      #     target_result[[j]] <- get(paste0("dc_", dc@name))(
      #       data[, j, drop = TRUE],
      #       data[, dc@input$target2, drop = TRUE]
      #     )
      #   } else {
      #     # All targets in a given dataset
      #     target_all <- data.frame(x = data[, j, drop = TRUE])
      #     # Unique set of all targets
      #     target_uniq <- data.frame(x = unique(target_all$x))
      #     # Perform data check only on the unique set (smaller than all)
      #     # And after this merge with all set (expand)
      #       target_uniq$res <- get(paste0("dc_", dc@name))(target_uniq$x)
      #     target_result[[j]] <- merge(
      #       target_all, target_uniq, "x", sort = FALSE
      #     )$res
      #   }
      # }
    }
input <- head(data_bats, n=20)$eventDate
i <- "eventdate_inrange"
cleaning_parts <- cleaning_table[i,] %>%
  .[which(!is.na(t(cleaning_table[i,])))] %>%
  sort() %>%
  colnames()

full_string <- "input"
for (i in seq_along(cleaning_parts)) {
  full_string <- c(full_string, paste(" %>%", cleaning_parts[i]))
}
full_string <- paste(full_string, collapse = "")

clean_input <- eval(parse(text = full_string))

############### meta function draft #####################
meta_clean <- function(
  input = NULL, 
  wanted_dc = NULL,
  cleaners = c(
	'{suppressWarnings(lubridate::as_date(., format = "%Y-%m-%d"))}', 
	'as.POSIXct()', 
	'gsub(" ", "", .)', 
	'{suppressWarnings(as.numeric(.))}', 
	'trimws()', 
	'tolower()', 
	'gsub("_| |\\.|-", "", .)'
  )
) {
  
/////

}
