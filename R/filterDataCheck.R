setGeneric("filterDataCheck", function(DCresult, DCfilts = NULL, rmFM = TRUE) {
    standardGeneric("filterDataCheck")
})
setMethod("filterDataCheck", "dataCheckFlag",
    function(DCresult, DCfilts, rmFM) {

        if (rmFM) {
            DCfilts <- list(name = sapply(DCresult@flags, function(x) `@`(x, name)),
                 target = sapply(DCresult@flags, function(x) `@`(x, target)),
                 filter = rep("FM", length(DCresult@flags)))
        }
        # !!!!!!!!!!!! ALSO chech for names in list
        if(is.null(DCfilts)) {
            warning("NOT PROVIDED")
            return(invisible())
        }

        # Using for loop as this is light function
        # And I want to keep it clear and simple
        idx <- c()
        names <- sapply(DCresult@flags, function(x) `@`(x, name))
        targets <- sapply(DCresult@flags, function(x) `@`(x, target))
        for(i in seq_along(DCfilts$name)) {
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
        }
        idx <- unique(idx)
        DCresult@dataMod[-idx, ]

})