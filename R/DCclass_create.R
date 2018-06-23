#' Create data check metadata
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

#' Create data check class
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

#' Create data check flag class
#' For a single data check
#' 
dataCheckFlag_SINGLE <- setClass(
    "dataCheckFlag_SINGLE",
    slots = c(
        name   = "character",
        target = "character",
        flag   = "character",
        result = "logical"))

#' Create data check flag class
#' For all performed data checks
#' 
dataCheckFlag <- setClass(
    "dataCheckFlag", 
    slots = c(
        DC       = "vector",
        flags    = "list",
        dataOrig = "data.frame",
        dataMod  = "data.frame"))

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