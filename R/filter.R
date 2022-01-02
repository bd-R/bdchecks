#' Filter Data Checks
#'
#' `dc_filter_generate()` is a function that generates vector for filtering 
#' data checks result table according to filtering table `selectCells` object.
#'
#' @param dc_result_summary Summary table for a DataCheckFlagSet class
#' (must be filterable in `DT`)
#' @param cell_selected Cells selected in filtering table.
#' @param filters Vector that contains names for passed, failed and missing
#' data checks
#'
#' @return A list that contains name of a data checks, it's target and
#' filtering status
#'
dc_filter_generate <- function(
  dc_result_summary,
  cell_selected,
  filters = c("P", "F", "M")
) {
  result <- lapply(unique(cell_selected[, 1]), function(i) {
    dc_current <- dc_result_summary[i, ]
    foo <- unique(cell_selected[cell_selected[, 1] == i, 2] - 2)
    list(
      name = dc_current[, 1],
      target = dc_current[, 2],
      filter = paste(filters[foo[foo > 0]], collapse = "")
    )
  })
  result <- list(
    name = unlist(lapply(result, "[[", 1)),
    target = unlist(lapply(result, "[[", 2)),
    filter = unlist(lapply(result, "[[", 3))
  )
  return(result)
}

#' Filter Data Checks
#'
#' `dc_filter()` is a function that filters data check result according
#'  to filtering vector.
#'
#' @param data Data set on which data checks where performed
#' @param dc_result Object of a DataCheckFlagSet generated with 
#' `perforDataCheck()`
#' @param dc_filts A list containing filtering targets and status generated 
#' with `dc_filter_generate()`
#'
#' @return A data.frame that is filtered according to given vector
#'
dc_filter <- function(data, dc_result, dc_filts) {
  idx <- c()
  names <- unlist(lapply(dc_result@flags, function(x) `@`(x, name)))
  targets <- unlist(lapply(dc_result@flags, function(x) `@`(x, target)))
  for (i in seq_along(dc_filts$name)) {
    if (nchar(dc_filts$filter[i]) < 3) {
      foo <- dc_result@flags[names == dc_filts$name[i] &
        targets == dc_filts$target[i]][[1]]@result
      bar <- c()
      # Remove passed
      if (grepl("P", dc_filts$filter[i], ignore.case = TRUE)) {
        bar <- c(bar, which(foo))
      }
      if (grepl("F", dc_filts$filter[i], ignore.case = TRUE)) {
        bar <- c(bar, which(!foo))
      }
      if (grepl("M", dc_filts$filter[i], ignore.case = TRUE)) {
        bar <- c(bar, which(is.na(foo)))
      }
      idx <- c(idx, bar)
    } else {
      stop("Can't filter all three")
    }
  }
  idx <- unique(idx)
  return(data[-idx, ])
}
