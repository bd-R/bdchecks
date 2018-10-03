#' Summarise Data Checks
#'
#' `summary_DC()` is a function that calculated statistics for how many data 
#' checks passed. It's main input is an object of a dataCheckFlag class and output 
#' is a summary table.
#' 
#' @param inputFlag Object of a dataCheckFlag class
#' @param fancy Should ouput be returned in a rst format
#' @param filteringDT Should output be returned as a summary table that could 
#' be parsed with a `DT` pacakge
#' 
#' @return A data.frame or rst table with summary statistics
#' 
#' @importFrom knitr kable
#' 
#' @examples
#' result <- performDataCheck(dataBats)
#' # Fancy summary table (for usage in reports)
#' summary_DC(result)
#' # object of class used for data filtering data.frame
#' summary_DC(result, fancy = FALSE, filteringDT = TRUE)
#' 
#' @export
#' 
summary_DC <- function(inputFlag, fancy = TRUE, filteringDT = FALSE) {
    res <- lapply(inputFlag@flags, function(x) {
        if (length(x@result) == 0) {
            return(NULL)
        } else {
            data.frame(check = x@name, target = x@target,
                       passed = sum(x@result, na.rm = TRUE) / length(x@result),
                       failed = sum(!x@result, na.rm = TRUE) / length(x@result),
                       missing = mean(is.na(x@result)))
        }
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

