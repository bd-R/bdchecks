#' Perform Data Checks
#' 
#' Method that performs data check on a given dataset
#' 
#' @name performDC
#' 
#' @param DC A data check as a dataCheck class object
#' @param DATA a data frame to perform data check on
#' 
#' @return A vector of logical values that determine if data check was passed on 
#' specific entry in a given DATA object
#' 
#' @rdname dataCheck
#' 
#' @exportMethod performDC
#'
setGeneric("performDC", function(DC, DATA) {
    standardGeneric("performDC")
}) 

#' @rdname dataCheck
#' 
#' @aliases performDC
#'
setMethod("performDC", "dataCheck",
    function(DC, DATA) {
        options(scipen = 999)
        # TARGETS
        targetNames <- unlist(strsplit(DC@input$Target, ","))
        for(j in seq_along(targetNames)) {
            if (!targetNames[j] %in% colnames(DATA)) {
                warning("Target ", targetNames[j], 
                        " doesn't exists in a given dataset,\ncheck ", DC@name,
                        " can't be performed")
                return(NULL)
            }
            assign(paste0("TARGET", j), DATA[, targetNames[j], drop = TRUE])
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
