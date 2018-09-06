################################################################################
################################################################################
#                                CLASSES
################################################################################
################################################################################


#' Data Check Meta-Data Class
#' 
#' @name dataCheckMeta-class
#' @rdname dataCheckMeta-class
#' @export
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

#' Create Data Check Class
#' 
#' @name dataCheck-class
#' @rdname dataCheck-class
#' @export
#'
#' @slot name of a data check
#' @slot meta meta-data for a data check of a dataCheckMeta class 
#' @slot input options for a data check 
#' @slot func expression to execute
#'
dataCheck <- setClass(
    "dataCheck",
    slots = c(
        name  = "character",
        meta  = "dataCheckMeta",
        input = "list",
        func  = "expression"))

#' Single Data Check Flag Class
#' 
#' @name dataCheckFlag_SINGLE-class
#' @rdname dataCheckFlag_SINGLE-class
#' @export
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

#' Combined Data Checks Class
#' 
#' @name dataCheckFlag-class
#' @rdname dataCheckFlag-class
#' @export
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




################################################################################
################################################################################
#                               GENERICS
################################################################################
################################################################################


#' Export Data Checks
#' 
#' Method that exports data checks
#' 
#' @param object A result of data checks (data check flag class)
#' 
#' @return A data.frame that contains original users data.frame modified according
#' to data checks
#' 
#' @export
#' @docType methods
#' @rdname exportDataCheck-methods
#' 
setGeneric("exportDataCheck", function(object) {
    standardGeneric("exportDataCheck")
})


#' Perform Data Checks
#' 
#' Method that performs data check on a given dataset
#' 
#' @param DC A data check as a dataCheck class object
#' @param DATA a data frame to perform data check on
#' 
#' @return A vector of logical values that determine if data check was passed on 
#' specific entry in a given DATA object
#' 
#' @importFrom utils install.packages
#' 
#' @export
#' @docType methods
#' @rdname performDC-methods
#' 
setGeneric("performDC", function(DC, DATA) {
    standardGeneric("performDC")
}) 





################################################################################
################################################################################
#                               METHODS
################################################################################
################################################################################



#' Show method for dataCheck objects
#' 
#' @rdname dataCheck-class
#' @param object a dataCheck object
#' @aliases dataCheck
#' 
setMethod("show", "dataCheck",
    function(object) {
        cat(" Data check is used to:\n\t",
              object@meta@description$Main, "\n",
              "This data check answers following question:\n\t",object@meta@description$Question, "\n",
              "Target (column) that this data checks operates on is:\n\t", object@input$Target, 
              "\n")
    }
)

#' Show method for dataCheckFlag objects
#' 
#' @rdname dataCheckFlag-class
#' @param object a dataCheckFlag object
#' @aliases dataCheckFlag
#' 
setMethod("show", "dataCheckFlag",
    function(object) {
        res <- lapply(object@flags, function(x) {
            data.frame(check = x@name, target = x@target)
        })
        res <- do.call(rbind, res)
        print(paste(res$check, "->", res$target))
    }
)


#' @rdname exportDataCheck-methods
#' 
#' @aliases exportDataCheck
#' 
setMethod("exportDataCheck", "dataCheckFlag", function(object) {
    return(object@dataMod)
})



#' @rdname performDC-methods
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
                TARGET1 <- NULL
                TARGET  <- NULL
            } else if (j == 1) {
                assign("TARGET", DATA[, targetNames[j], drop = TRUE])
                assign("TARGET1", DATA[, targetNames[j], drop = TRUE])
            } else {
                assign(paste0("TARGET", j), DATA[, targetNames[j], drop = TRUE])
            }
        }
        TARGETS <- ls(pattern = "TARGET\\d+")
        if (is.null(TARGETS) | is.null(TARGET)) {
            return(NULL)
        }

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
                if (j == 1) {
                    assign("DEPEND", eval(parse(text = dependencies[j])))
                }
            }
            DEPENDS <- ls(pattern = "DEPEND\\d+")
        }
        eval(DC@func)()
})