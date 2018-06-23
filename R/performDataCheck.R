performDataCheck <- function(data = NULL,
                             DC = ls(pos = ("package:bdchecks"), pattern = "^DC_")) {
    wantedDC    <- sub("^DC_", "", DC)
    performedDC <- character(length(DC))
    result <- list()
    while(!all(wantedDC %in% performedDC)) {
        for(i in seq_along(DC)) {
            DCcurrent <- get(DC[[i]])
            # If there are no dependencies then it's safe to run DC
            DCsafe <- is.null(DCcurrent@input$Dependency$DataChecks)
            if (!DCsafe) {
                # Check if required dependencies are already performed
                DCsafe <- DCcurrent@input$Dependency$DataChecks %in% performedDC
            }

            if (DCsafe & !wantedDC[i] %in% performedDC) {
                result[[i]] <- new("dataCheckFlag_SINGLE",
                    name   = DCcurrent@name,
                    target = DCcurrent@input$Target,
                    result = performDC(DCcurrent, data),
                    flag   = "foo")
                performedDC[i] <- wantedDC[i]
            }
        }
    }
    resultDC <- new("dataCheckFlag", 
        DC       = as.character(lapply(result, function(x) `@`(x, name))),
        flags    = result,
        dataOrig = data,
        dataMod  = data)
    return(resultDC)
}