library(bdchecks)


# Doesn't work  (adjust export)
# ls(envir = asNamespace("bdchecks"))
# DC <- getDC()

dataCheckFlag_SINGLE <- setClass(
    "dataCheckFlag_SINGLE",
    slots = c(
        name   = "character",
        target = "character",
        flag   = "character",
        result = "logical"))

dataCheckFlag <- setClass(
    "dataCheckFlag", 
    slots = c(
        DC       = "vector",
        flags    = "list",
        dataOrig = "data.frame",
        dataMod  = "data.frame"))

performDataCheck <- function(data = NULL, DC = getDC()) {
    wantedDC    <- sub("^DC_", "", names(DC))
    performedDC <- character(length(DC))
    result <- list()
    while(!all(wantedDC %in% performedDC)) {
        for(i in seq_along(DC)) {
            # If there are no dependencies then it's safe to run DC
            DCsafe <- is.null(DC[[i]]@input$Dependency$DataChecks)
            if (!DCsafe) {
                # Check if required dependencies are already performed
                DCsafe <- DC[[i]]@input$Dependency$DataChecks %in% performedDC
            }

            if (DCsafe & !wantedDC[i] %in% performedDC) {
                result[[i]] <- new("dataCheckFlag_SINGLE",
                    name   = DC[[i]]@name,
                    target = DC[[i]]@input$Target,
                    result = performDC(DC[[i]], data),
                    flag   = "foo")
                performedDC[i] <- wantedDC[i]
            }
        }
    }
    resultDC <- new("dataCheckFlag", 
        DC       = as.character(lapply(result, function(x) `@`(x, name))),
        flags    = result,
        dataOrig = data,
        dataMod  = data)
    return(resultDC)
}

setMethod("show", "dataCheckFlag",
    function(object) print(object@DC)
)
setMethod("show", "dataCheckFlag_SINGLE",
    function(object) print(paste(object@name, object@target))
)


setGeneric("exportDataCheck", function(DCresult, writeFile = FALSE, file = "result.csv", verbose = TRUE) standardGeneric("exportDataCheck"))
setMethod("exportDataCheck", "dataCheckFlag",
    function(DCresult, writeFile = FALSE, file = "result.csv", verbose = TRUE) {
        if (writeFile) {
            if (verbose) {
                message(paste("Writing file to", file))
            }
            write.csv(DCresult@dataMod, file)
        } else {
            return(DCresult@dataMod)
        }
})

setGeneric("shortSummaryDataCheck", function(DCresult) standardGeneric("shortSummaryDataCheck"))
setMethod("shortSummaryDataCheck", "dataCheckFlag",
    function(DCresult) {
        res <- lapply(DCresult@flags, function(x) {
            data.frame(name = x@name, passed = paste(round(mean(x@result) * 100, 2), "%"))
        })
        res <- do.call(rbind, res)
        cli::cat_bullet(format(res$name), ": ", res$passed)
})


setGeneric("longSummaryDataCheck", function(DCresult) standardGeneric("longSummaryDataCheck"))
setMethod("longSummaryDataCheck", "dataCheckFlag",
    function(DCresult) {
        library(ggplot2)
        res <- list()
        pdf()
        for(i in seq_along(DCresult@flags)) {
            name <- DCresult@flags[[i]]@name
            target <- sub(",.*", "", DCresult@flags[[i]]@target)
            pd <- data.frame(x = DCresult@flags[[i]]@result)
            pd2 <- data.frame(table(pd))
            pd2$ID <- ifelse(as.logical(pd2$pd), "Passed", "Failed")
            pd2$per <- paste0(round(pd2$Freq * 100 / sum(pd2$Freq), 1), "%")
            p1 <- ggplot(pd2, aes(ID, Freq, fill = ID)) +
                geom_bar(stat = "identity", position = "dodge",
                         width = 0.8, color = "black") +
                geom_text(aes(label = per), vjust = -1) +
                scale_fill_brewer(palette = "Set1") +
                labs(title = paste("Data check:", name),
                     subtitle = paste("Target column:", target),
                     x = NULL,
                     y = "# records",
                     fill = NULL) +
                theme_classic() +
                theme(axis.ticks = element_blank(),
                      legend.position = "none")
            pd3 <- data.frame(x = table(DCresult@dataOrig[!pd$x, target]))
            if (nrow(pd3) > 0) {
                colnames(pd3) <- c("ID", "Freq")
                pd3$per <- paste0(round(pd3$Freq * 100 / sum(pd3$Freq), 1), "%")
                p2 <- ggplot(pd3, aes(ID, Freq, fill = ID)) +
                    geom_bar(stat = "identity", position = "dodge",
                             width = 0.8, color = "black") +
                    geom_text(aes(label = per), vjust = -1) +
                    labs(title = paste("Data check:", name),
                         subtitle = paste("Failed targets in", target),
                         x = NULL,
                         y = "# records",
                         fill = NULL) +
                    theme_classic() +
                    theme(axis.ticks = element_blank(),
                          legend.position = "none")
                # res[[i]] <- 
                egg::ggarrange(p1, p2, ncol = 2)
            } else {
                # res[[i]] <- 
                egg::ggarrange(p1, ncol = 2)
            }
        }
        dev.off()
})

setGeneric("filterDataCheck", function(DCresult) standardGeneric("filterDataCheck"))
setMethod("filterDataCheck", "dataCheckFlag",
    function(DCresult) {
        res <- lapply(DCresult@flags, function(x) {
            data.frame(name = x@name, passed = paste(round(mean(x@result) * 100, 2), "%"))
        })
        res <- do.call(rbind, res)
        cli::cat_bullet(format(res$name), ": ", res$passed)
})

# ------------

dataBats$country[1:100] <- "Canada"
dataBats$country[150:200] <- "Japan"
DCresult <- performDataCheck(dataBats)
# DCresult
# DCresult@dataOrig
# DCresult@dataMod
# exportDataCheck(DCresult, writeFile = TRUE, file = "tmp_result.csv")
# dataAfterDC <- exportDataCheck(DCresult)

shortSummaryDataCheck(DCresult)
longSummaryDataCheck(DCresult)
filterDataCheck(DCresult, )
# more data checks
