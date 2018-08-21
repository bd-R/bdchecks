#' Filter Data Checks
#'
#' `generateDCfilts()` is a function that generates vector for filtering data 
#' checks result table according to `DT::datatable()` `selectedCells` object.
#' 
#' @param DCresultSummary Summary table for a dataCheckFlag class
#' (must be filterable in `DT`)
#' @param selectedCells Cells selected in `DT::datatable`
#' @param filters Vector that contains names for passed, failed and missing 
#' data checks
#' 
#' @return A list that contains name of a data checks, it's target and 
#' filtering status
#'
generateDCfilts <- function(DCresultSummary, selectedCells, filters = c("P", "F", "M")) {
    result <- lapply(unique(selectedCells[, 1]), function(i) {
        DCcurrent <- DCresultSummary[i, ]
        foo <- unique(selectedCells[selectedCells[, 1] == i, 2] - 1)
        list(name = DCcurrent[, 1],
             target = DCcurrent[, 2],
             filter = paste(filters[foo[foo > 0]], collapse = ""))
    })
    result <- list(name = sapply(result, "[[", 1),
                   target = sapply(result, "[[", 2),
                   filter = sapply(result, "[[", 3))
    return(result)
}

#' Filter Data Checks
#'
#' `filterDataCheck()` is a function that filters data check result according
#'  to filtering vector.
#' 
#' @param DCresult Object of a dataCheckFlag generated with `perforDataCheck()`
#' @param DCfilts A list containing filtering targets and status generated with 
#' `generateDCfilts()`
#' 
#' @return A data.frame that is filtered according to given vector
#' 
filterDataCheck <- function(DCresult, DCfilts) {
    idx <- c()
    names <- sapply(DCresult@flags, function(x) `@`(x, name))
    targets <- sapply(DCresult@flags, function(x) `@`(x, target))
    for(i in seq_along(DCfilts$name)) {
        if (nchar(DCfilts$filter[i]) < 3) {
            foo <- DCresult@flags[names == DCfilts$name[i] & targets == DCfilts$target[i]][[1]]@result
            bar <- c()
            # Remove passed
            if (grepl("P", DCfilts$filter[i], ignore.case = TRUE)) {
                bar <- c(bar, which(foo))
            }
            if (grepl("F", DCfilts$filter[i], ignore.case = TRUE)) {
                bar <- c(bar, which(!foo))
            }
            if (grepl("M", DCfilts$filter[i], ignore.case = TRUE)) {
                bar <- c(bar, which(is.na(foo)))
            }
            idx <- c(idx, bar)
        } else {
            warning("Can't filter all three")
        }
    }
    idx <- unique(idx)
    return(DCresult@dataMod[-idx, ])
}