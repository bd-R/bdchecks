#'
#' Data check month_standard Check if month is an integer between 1 and 12
#' inclusive.
#'
#'     This data check answers: "Is month an integer between 1 and 12
#' inclusive?" question.\cr Data check will pass if \strong{The value for
#' month within given numbers.} and will fail if \strong{The value for month is
#' not within given numbers.}.\cr Dimension of this data check is \strong{}
#' and it's flagging type is: \strong{FLAG}\cr Example of entries that will
#' pass: \code{month=6}, such data check would return \code{TRUE}.\cr Example
#' of entries that will fail: \code{month=13}, such data check would return
#' @name dc_month_standard
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'month_standard')
#' @section samplePassData:
#' The value for month within given numbers.
#' @section sampleFailData:
#' The value for month is not within given numbers.
#' @section targetDWCField:
#' month
#' @section checkCategory:
#'  event
#' @importFrom magrittr %>%
#' @export
#' @keywords time,validation,conformance
NULL
