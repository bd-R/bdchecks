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

generateDCfilts <- function(DCresult, selectedCells) {
    filters <- c("P", "M", "F")
    result <- lapply(unique(selectedCells[, 1]), function(i) {
        DCcurrent <- DCresult[selectedCells[i, 1], ]
        tmpFilt <- filters[unique(selectedCells[selectedCells[, 1] == i, 2] - 2)]
        list(name = DCcurrent$check,
             target = DCcurrent$target,
             filter = paste(tmpFilt, collapse = ""))
    })

    list(name = sapply(result, "[[", 1),
         target = sapply(result, "[[", 2),
         filter = sapply(result, "[[", 3))
}