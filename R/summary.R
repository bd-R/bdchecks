#' Summarise Data Checks
#'
#' `summary_dc()` is a function that calculated statistics for how many data
#' checks passed. It's main input is an object of a DataCheckFlagSet class and 
#' output is a summary table.
#'
#' @param input_flag Object of a DataCheckFlagSet class.
#' @param fancy Should output be returned in a rst format.
#' @param filtering_dt Should output be returned as a summary table.
#'
#' @return A data.frame or rst table with summary statistics
#'
#' @importFrom knitr kable
#'
#' @examples
#' result <- perform_dc(data_bats)
#' # Fancy summary table (for usage in reports)
#' summary_dc(result)
#' # object of class used for data filtering data.frame
#' summary_dc(result, fancy = FALSE, filtering_dt = TRUE)
#' 
#' @export
#'
summary_dc <- function(input_flag, fancy = TRUE, filtering_dt = FALSE) {
  res <- lapply(input_flag@flags, function(x) {
    if (length(x@result) == 0) {
      return(NULL)
    } else {
      data.frame(
        check = x@name,
        target = x@target,
        passed = sum(x@result, na.rm = TRUE) / length(x@result),
        failed = sum(!x@result, na.rm = TRUE) / length(x@result),
        missing = mean(is.na(x@result)),
        stringsAsFactors = FALSE
      )
    }
  })
  res <- do.call(rbind, res)
  res <- res[order(res$check, res$target), ]
  rownames(res) <- NULL
  if (!fancy & !filtering_dt) {
    return(res)
  } else {
    res$passed <- as.character(round(res$passed * 100, 2))
    res$failed <- as.character(round(res$failed * 100, 2))
    res$missing <- as.character(round(res$missing * 100, 2))
    colnames(res) <- c(
      "Data Check", "Column (Target)",
      "Passed, %", "Failed, %", "Missing,% "
    )
    if (fancy) {
      return(knitr::kable(res, format = "rst"))
    }
    if (filtering_dt) {
      return(res)
    }
  }
}
