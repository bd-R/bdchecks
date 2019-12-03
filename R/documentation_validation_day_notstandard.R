#'
#' Data check validation_day_notstandard Check if day is an integer between 1 and 31 inclusive.
#'
#'     This data check answers: "Is day an integer between 1 and 31 inclusive?" question.\cr Data check will pass if \strong{The value for day within given numbers.} and will fail if \strong{The value for day is not within given numbers.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{day=6}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{day=32}, such data check would return \code{FALSE}.
#' @name dc_validation_day_notstandard
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_day_notstandard')
#' @section samplePassData:
#' The value for day within given numbers.
#' @section sampleFailData:
#' The value for day is not within given numbers.
#' @section targetDWCField:
#' day
#' @section checkCategory:
#'  event
#' @importFrom magrittr %>%
#' @export
#' @keywords time,validation,conformance
NULL
