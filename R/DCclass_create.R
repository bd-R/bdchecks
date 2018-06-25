#' Data check meta-data class
#' 
#' @name dataCheckMeta-class
#' @rdname dataCheckMeta-class
#' @exportClass dataCheckMeta
#'
#' @slot description of data check
#' @slot flags for specific data check
#' @slot pseudocode for this datachecks
#' @slot source creators information
#'
dataCheckMeta <- setClass(
    "dataCheckMeta",
    slots = c(
        description = "list",
        flags       = "list",
        pseudocode  = "character",
        source      = "list"))

#' Create data check class
#' 
#' @name dataCheck-class
#' @rdname dataCheck-class
#' @exportClass dataCheck
#'
#' @slot name of a data check
#' @slot meta meta-data for a data check of a dataCheckMeta class 
#' @slot input options for a data check 
#' @slot func expression to execute
#'
dataCheck <- setClass(
    "dataCheck",
    slots = c(
        name   = "character",
        meta   = "dataCheckMeta",
        input  = "list",
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

setMethod("show", "dataCheck",
    function(object) {
        cat(" Data check is used to:\n\t",
              object@meta@description$Main, "\n",
              "This data check answers following question:\n\t",object@meta@description$Question, "\n",
              "Target (column) that this data checks operates on is:\n\t", object@input$Target, 
              "\n")
    }
)