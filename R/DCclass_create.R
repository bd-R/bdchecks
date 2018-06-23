#' Data check meta-data class
#' 
#' @name dataCheckMeta-class
#' @rdname dataCheckMeta-class
#' @exportClass dataCheckMeta
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
#' @name dataCheck-class
#' @rdname dataCheck-class
#' @exportClass dataCheck
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
#' @name dataCheckFlag_SINGLE-class
#' @rdname dataCheckFlag_SINGLE-class
#' @exportClass dataCheckFlag_SINGLE
#' 
#' @slot name of performed data check
#' @slot target column for performed data check
#' @slot flag class
#' @slot result logical vector
#' 
dataCheckFlag_SINGLE <- setClass(
    "dataCheckFlag_SINGLE",
    slots = c(
        name   = "character",
        target = "character",
        flag   = "character",
        result = "logical"))

#' Combined data checks class
#' 
#' @name dataCheckFlag-class
#' @rdname dataCheckFlag-class
#' @exportClass dataCheckFlag
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