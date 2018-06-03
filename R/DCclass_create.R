#' Create DC meta
#'
dataCheckMeta <- setClass(
    "dataCheckMeta",
    slots = c(
        description = "list",
        keywords    = "character",
        question    = "character",
        dimension   = "character",
        pseudocode  = "character",
        source      = "list",
        example     = "list"))

#' Create DC
#'
dataCheck <- setClass(
    "dataCheck",
    slots = c(
        name   = "character",
        guid   = "character",
        meta   = "dataCheckMeta",
        input  = "list",
        output = "list",
        func   = "expression"))

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
#' Create a data check metatadata from a given YAML file
#' 
#' @param DCmeta Data check metadata slot in YAML format
#' 
#' @return Data check metadata object
#' 
createDCclassMeta <- function(DCmeta) {
    res <- new("dataCheckMeta",
               description = DCmeta$Description,
               question    = DCmeta$InputQuestion,
               dimension   = DCmeta$Dimension,
               source      = DCmeta$Source,
               keywords    = DCmeta$Keywords,
               example     = DCmeta$Example,
               pseudocode  = DCmeta$Pseudocode)
    return(res)
}
#' Create a data check object from a given YAML file
#' 
#' @param DCyaml Data check slot in YAML format
#'
#' @return Data check object
#' 
#' @export
#' 
createDCclassMain <- function(DCyaml) {
    res <- new("dataCheck",
               name   = DCyaml$name,
               guid   = DCyaml$guid,
               meta   = createDCclassMeta(DCyaml$meta),
               input  = DCyaml$Input,
               output = DCyaml$Output,
               func   = parse(text = DCyaml$Functionality))
    return(res)
}