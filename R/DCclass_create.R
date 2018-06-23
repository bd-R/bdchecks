#' Data check meta-data class
#'
#' @slot description of data check
#' @slot keywords for specific data check
#' @slot question that this data check answers
#' @slot dimension of a data check
#' @slot pseudocode for this datachecks
#' @slot source creators information
#' @slot example of passed and failed inputs
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
#' @slot name of a data check
#' @slot guid unique identifier for a data check
#' @slot meta meta-data for a data check of a dataCheckMeta class 
#' @slot input options for a data check 
#' @slot output options for a data check 
#' @slot func expression to execute
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

#' Single data check flag class
#' 
#' @slot name of performed data check
#' @slot target column for performed data check
#' @slot flag class
#' @slot result logical vector
#' @slot 
dataCheckFlag_SINGLE <- setClass(
    "dataCheckFlag_SINGLE",
    slots = c(
        name   = "character",
        target = "character",
        flag   = "character",
        result = "logical"))

#' Combined data checks class
#' 
#' @slot DC names of performed data checks
#' @slot flags list of performed data checks in a dataCheckFlag_SINGLE class
#' @slot dataOrig original data before data checks
#' @slot dataMod modified data after data checks
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