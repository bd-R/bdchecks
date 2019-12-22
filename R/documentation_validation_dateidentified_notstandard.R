#'
#' Data check validation_dateidentified_notstandard Check if dateIdentified is a valid ISO 8601-1:2019 date.
#'
#'     This data check answers: "Is dateIdentified a valid ISO 8601-1:2019 date?" question.\cr Data check will pass if \strong{Given dateIdentified is a valid ISO 8601-1:2019 date.} and will fail if \strong{Given dateIdentified is not a valid ISO 8601-1:2019 date.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{dateIdentified="02021981"}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{dateIdentified="2018-02-02"}, such data check would return \code{FALSE}.
#' @name dc_validation_dateidentified_notstandard
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_dateidentified_notstandard')
#' @section samplePassData:
#' Given dateIdentified is a valid ISO 8601-1:2019 date.
#' @section sampleFailData:
#' Given dateIdentified is not a valid ISO 8601-1:2019 date.
#' @section targetDWCField:
#' dateIdentified
#' @section checkCategory:
#'  event
#' @importFrom magrittr %>%
#' @export
#' @keywords time,validation,conformance
NULL
