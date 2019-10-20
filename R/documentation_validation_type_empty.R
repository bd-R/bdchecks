#'
#' Data check validation_type_empty Check if type exists and is not empty.
#'
#'     This data check answers: "Is type information present?" question.\cr Data check will pass if \strong{The value for type is present.} and will fail if \strong{The value for type is missing.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{type=Image}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{type=}, such data check would return \code{FALSE}.
#' @name dc_validation_type_empty
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_type_empty')
#' @section samplePassData:
#' The value for type is present.
#' @section sampleFailData:
#' The value for type is missing.
#' @section targetDWCField:
#' type
#' @section checkCategory:
#'  Record-level Terms
#' @importFrom magrittr %>%
#' @export
#' @keywords other,validation,completness,missing,incomplete
NULL
