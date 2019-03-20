#' Perform Data Checks
#'
#' `performDataCheck()` is a function for performing all available data checks
#' on a give data set
#'
#' @param data Data set to perform data checks
#' @param DCadd Character vector of names for additional data checks to be performed
#' @param DConly Character vector of names for data checks that should be performed 
#' (ie perform only these data checks)
#' @param DCstand Character vector of standardize data checks
#' @param verbose Message which data check is being performed
#'
#' @importFrom methods new
#' 
#' @return Object of a dataCheckFlag class (combined result for all performed
#' data checks)
#' 
#' @examples
#' performDataCheck(data_bats)
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

    wanted_dc    <- sub("^DC_", "", DCall)
    performed_dc <- character(length(DCall))

    result_dc <- list()
    while (!all(wanted_dc %in% performed_dc)) {
        for (i in seq_along(DCall)) {

            DCcurrent <- get(DCall[[i]])

            # If there are no dependencies then it's safe to run DC
            DCsafe <- is.null(DCcurrent@input$Dependency$DataChecks)
            if (!DCsafe) {
                if (!DCcurrent@input$Dependency$DataChecks %in% wanted_dc) {
                    # If dependency is not the list then perform it
                    DCsafe <- TRUE
                    warning("Dependency ",
                            paste(DCcurrent@input$Dependency$DataChecks,
                                  collapse = ", "),
                            " for data check ", DCcurrent@name,
                            " wasn't not specified to run.\n
                            Will ignore this dependency")
                } else {
                    # Check if required dependencies are already performed
                    DCsafe <-
                    DCcurrent@input$Dependency$DataChecks %in% performed_dc
                }
            }

            if (DCsafe & !wanted_dc[i] %in% performed_dc) {
                current_result <- performDC(DCcurrent, data)
                if (class(current_result) == "list") {
                    for (j in seq_along(current_result)) {
                        if (!is.null(current_result)) {
                            result_dc[[length(result_dc) + 1]] <-
                                methods::new("dataCheckFlag_SINGLE",
                                    name   = DCcurrent@name,
                                    target = unlist(strsplit(
                                        DCcurrent@input$Target, ","))[j],
                                    result = current_result[[j]],
                                    flag   = "foo"
                                )
                        }
                    }
                } else {
                    if (!is.null(current_result)) {
                        result_dc[[length(result_dc) + 1]] <- methods::new(
                            "dataCheckFlag_SINGLE",
                            name   = DCcurrent@name,
                            target = DCcurrent@input$Target,
                            result = current_result,
                            flag   = "foo")
                    }
                }
                # !!! with NULL results dependencies wont work
                # !!! what if one target is null and another returns result?
                performed_dc[i] <- wanted_dc[i]
            }
        }
    }
    if (length(result_dc) > 0) {
        result_dc <- methods::new("dataCheckFlag",
            DC       = as.character(lapply(result_dc, 
                                           function(x) `@`(x, name))),
            flags    = result_dc,
            dataOrig = data,
            dataMod  = data)
        return(result_dc)
    } else {
        return(NULL)
    }
}