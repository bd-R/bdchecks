#' Create a data check metatadata from a given YAML file
#' 
#' @param fancy Nice kable outptu
#' 
#' @return result
#' 
summary_DC <- function(object, fancy = TRUE, filteringDT = FALSE) {
    res <- lapply(object@flags, function(x) {
        data.frame(check = x@name, target = x@target,
                   passed = sum(x@result, na.rm = TRUE) / length(x@result),
                   failed = sum(!x@result, na.rm = TRUE) / length(x@result),
                   missing = mean(is.na(x@result)))
    })
    res <- do.call(rbind, res)
    res$check <- as.character(res$check)
    res$target <- as.character(res$target)
    res <- res[order(res$failed, decreasing = TRUE), ]
    rownames(res) <- NULL
    if (!fancy & !filteringDT) {
        return(res)
    } else {
        res$passed <- as.character(round(res$passed * 100, 2))
        res$failed <- as.character(round(res$failed * 100, 2))
        res$missing <- as.character(round(res$missing * 100, 2))
        colnames(res) <- c("Data Check", "Column (Target)", 
                           "Passed, %", "Failed, %", "Missing,% ")
        if (fancy) {
            return(knitr::kable(res, format = "rst"))
        } 
        if (filteringDT) {
            return(res)
        }
    }
}
#' Perform data check
#'
#' @export
#' 
setGeneric("summary")
setMethod("summary", "dataCheckFlag", summary_DC)
