#' Create Data Check Class
#'
#' @name DataCheck-class
#' @rdname DataCheck-class
#' @export
#'
#' @slot name Official name of biodiversity data check
#' @slot title Tidy name of biodiversity data check
#' @slot input Additional options to perform a data check
#' @slot output Additional options to modify data check flags
#' @slot information Information about the data check
#' @slot example Example of input and corresponding output
#' @slot pseudocode R pseudocode for a data check
#' @slot source Information about creators and maintenance 
#'
DataCheck <- setClass(
  "DataCheck",
  slots = c(
    name = "character",
    title = "character",
    input = "list",
    output = "list",
    information = "list",
    example = "list",
    pseudocode = "character",
    source = "list"
  )
)

#' Create Data Check Class
#'
#' @name DataCheckSet-class
#' @rdname DataCheckSet-class
#' @export
#'
#' @slot dc_body Set of all available data checks
#' 
DataCheckSet <- setClass(
  "DataCheckSet",
  slots = c(dc_body = "list")
)

#' Show method for dataCheck objects
#'
#' @rdname DataCheck-class
#' @param object a dataCheck object
#' @aliases dataCheck
#'
setMethod(
  "show", "DataCheck",
  function(object) {
    message(
      "Data check is used to:\n   ",
      object@information$description, "\n",
      "This data check answers following question:\n   ",
      object@information$question, "\n",
      "Target columns that this data check operates on:\n   ",
      object@input$target,
      "\n"
    )
  }
)

#' Single Data Check Flag Class
#'
#' @name DataCheckFlag-class
#' @rdname DataCheckFlag-class
#' @export
#'
#' @slot name of performed data check
#' @slot target column for performed data check
#' @slot flag standard flag information
#' @slot result logical vector
#'
DataCheckFlag <- setClass(
  "DataCheckFlag",
  slots = c(
    name = "character",
    target = "character",
    flag = "character",
    result = "logical"
  )
)

#' Combined Data Checks Class
#'
#' @name DataCheckFlagSet-class
#' @rdname DataCheckFlagSet-class
#' @export
#'
#' @slot DC names of performed data checks
#' @slot flags list of performed data checks in a DataCheckFlagSet class
#'
DataCheckFlagSet <- setClass(
  "DataCheckFlagSet",
  slots = c(DC = "vector", flags = "list")
)

#' Show method for DataCheckFlagSet objects
#'
#' @rdname DataCheckFlagSet-class
#' @param object a DataCheckFlagSet object
#' @aliases DataCheckFlagSet
#'
setMethod(
  "show", "DataCheckFlagSet",
  function(object) {
    res <- lapply(object@flags, function(x) {
      data.frame(check = x@name, target = x@target)
    })
    res <- do.call(rbind, res)
    #message(paste(res$check, "->", res$target, "\n"))
    bar <- data.frame(check = res$check, target = res$target)
    message("Performed data checks: \n", 
         paste0(capture.output(bar), collapse = "\n")
       )
    # if (!is.null(not_performed)) {
    #   not_performed <- not_performed[!not_performed$check %in% bar$check,]
    #   message("Performed data checks: \n", 
    #     paste0(capture.output(bar), collapse = "\n"),
    #     "\n\nNot performed data checks (because of missing columns): \n",
    #     paste0(capture.output(not_performed), collapse = "\n")
    #   )
    # } else {
    #   message("Performed data checks: \n", 
    #     paste0(capture.output(bar), collapse = "\n")
    #   )
    # }
  }
)
