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
    DCresult@dataMod[-idx, ]
}

generateDCfilts <- function(DCresultSummary, selectedCells, filters = c("P", "F", "M")) {
    result <- lapply(unique(selectedCells[, 1]), function(i) {
        DCcurrent <- DCresultSummary[i, ]
        foo <- unique(selectedCells[selectedCells[, 1] == i, 2] - 1)
        list(name = DCcurrent[, 1],
             target = DCcurrent[, 2],
             filter = paste(filters[foo[foo > 0]], collapse = ""))
    })

    list(name = sapply(result, "[[", 1),
         target = sapply(result, "[[", 2),
         filter = sapply(result, "[[", 3))
}