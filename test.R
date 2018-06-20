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
                # !!! Add random info
                if (DC[[i]]@name == "countryNameUnkown") {
                    result[[i]]@result <- sample(c(TRUE, FALSE), nrow(data), replace = TRUE)
                }
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

# ------------

DCresult <- performDataCheck(dataBats)
# DCresult@dataOrig
# DCresult@dataMod
# DCresult@flags[[1]]
# DCresult@flags[[1]]@result
# exportDataCheck(DCresult, writeFile = TRUE, file = "tmp_result.csv")
# dataAfterDC <- exportDataCheck(DCresult)

shortSummaryDataCheck(DCresult)
longSummaryDataCheck(DCresult)
filterDataCheck(DCresult, )
# more data checks
