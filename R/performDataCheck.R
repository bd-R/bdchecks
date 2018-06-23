#' Perform data checks
#'
#' `performDataCheck()` is a function for performing all available data checks
#' on a give data set
#'
#' @param data Data set to perform data checks
#' @param DCadd Character vector of names for additional data checks to be performed
#' @param DCstand Character vector of standardize data checks
#' @param verbose Message which data check is being performed
#'
#' @return Object of a dataCheckFlag class (combined result for all performed
#' data checks)
#' 
#' @examples
#' resultDataChecks <- performDataCheck(dataBats)
#' 
#' @export
#' 
performDataCheck <- function(
    data    = NULL,
    DCadd   = NULL,
    DConly  = NULL,
    verbose = TRUE,
    DCstand = ls(pos = ("package:bdchecks"), pattern = "^DC_")) {

    # All data checks to perform
    if (!is.null(DConly)) {
        DCall <- DConly
    } else {
        DCall <- unique(c(DCadd, DCstand))
    }

    # Check if all data checks exists
    DCexists <- sapply(DCall, exists)
    if (any(!DCexists)) {
        warning("Following data checks don't exists (will skip them):\n", 
                paste(DCall[!DCexists], collapse = ", "))
        DCall <- DCall[DCexists]
    }
    
    wantedDC    <- sub("^DC_", "", DCall)
    performedDC <- character(length(DCall))

    resultDC <- list()
    while(!all(wantedDC %in% performedDC)) {
        for(i in seq_along(DCall)) {

            DCcurrent <- get(DCall[[i]])

            # If there are no dependencies then it's safe to run DC
            DCsafe <- is.null(DCcurrent@input$Dependency$DataChecks)
            if (!DCsafe) {
                if (!DCcurrent@input$Dependency$DataChecks %in% wantedDC) {
                    # If dependency is not the list then perform it
                    DCsafe <- TRUE
                    warning("Dependency ", 
                            paste(DCcurrent@input$Dependency$DataChecks, collapse = ", "),
                            " for data check ", DCcurrent@name, 
                            " wasn't not specified to run.\n
                            Will ignore this dependency")
                } else {
                    # Check if required dependencies are already performed
                    DCsafe <- DCcurrent@input$Dependency$DataChecks %in% performedDC
                }
            }

            if (DCsafe & !wantedDC[i] %in% performedDC) {
                if (verbose) {
                    message("Performing data check: ", DCcurrent@name)
                }
                resultDC[[i]] <- new("dataCheckFlag_SINGLE",
                    name   = DCcurrent@name,
                    target = DCcurrent@input$Target,
                    result = performDC(DCcurrent, data),
                    flag   = "foo")
                performedDC[i] <- wantedDC[i]
            }
        }
    }
    resultDC <- new("dataCheckFlag", 
        DC       = as.character(lapply(resultDC, function(x) `@`(x, name))),
        flags    = resultDC,
        dataOrig = data,
        dataMod  = data)
    return(resultDC)
}