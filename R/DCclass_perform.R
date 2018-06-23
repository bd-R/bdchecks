#' Perform data check
#'
#' @export
#' 
setGeneric("performDC", function(DC, data) standardGeneric("performDC"))
setMethod("performDC", "dataCheck",
    function(DC, data) {

        # TARGETS
        targetNames <- unlist(strsplit(DC@input$Target, ","))
        for(j in seq_along(targetNames)) {
            assign(paste0("TARGET", j), data[, targetNames[j], drop = TRUE])
        }
        if (length(targetNames) == 1) {
            TARGET <- TARGET1
        }
        TARGETS <- ls(pattern = "TARGET\\d+")

        # DEPENDENCIES
        if (!is.null(DC@input$Dependency$Rpackages)) {
            if (!require(DC@input$Dependency$Rpackages, character.only = TRUE)) {
                install.packages(DC@input$Dependency$Rpackages)
            }
                library(DC@input$Dependency$Rpackages, character.only = TRUE)
        }
        if (!is.null(DC@input$Dependency$Data)) {
            dependencies <- unlist(strsplit(DC@input$Dependency$Data, ","))
            for(j in seq_along(dependencies)) {
                assign(paste0("DEPEND", j), eval(parse(text = dependencies[j])))
            }
            if (length(dependencies) == 1) {
                DEPEND <- DEPEND1
            }
            DEPENDS <- ls(pattern = "DEPEND\\d+")
        }
        eval(DC@func)()
})
