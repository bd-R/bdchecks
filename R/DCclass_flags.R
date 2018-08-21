#' @rdname dataCheckFlag
#' 
#' @aliases show
#' 
setMethod("show", "dataCheckFlag",
    function(object) {
        res <- lapply(object@flags, function(x) {
            data.frame(check = x@name, target = x@target)
        })
        res <- do.call(rbind, res)
        paste(res$check, "->", res$target)
    }
)

#' Export Data Checks
#' 
#' Method that exports data checks
#' 
#' @name exportDataCheck
#' 
#' @param DCresult A result of data checks (data check flag class)
#' 
#' @return A data.frame that contains original users data.frame modified according
#' to data checks
#' 
#' @rdname dataCheckFlag
#' 
#' @exportMethod exportDataCheck
#'
setGeneric("exportDataCheck", function(DCresult) {
    standardGeneric("exportDataCheck")
})

#' @rdname dataCheckFlag
#' 
#' @aliases exportDataCheck
#'
setMethod("exportDataCheck", "dataCheckFlag", function(DCresult) {
    return(DCresult@dataMod)
})