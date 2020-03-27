#'
#' Data check validation_month_empty Check if month exists and is not empty.
#'
#'     This data check answers: "Is month information present?" question.\cr Data check will pass if \strong{The value for month is present.} and will fail if \strong{The value for month is missing.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{month=2001-01-01}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{month=}, such data check would return \code{FALSE}.
#' @name dc_validation_month_empty
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_month_empty')
#' @section samplePassData:
#' The value for month is present.
#' @section sampleFailData:
#' The value for month is missing.
#' @section targetDWCField:
#' month
#' @section checkCategory:
#'  event
#' @importFrom magrittr %>%
#' @export
#' @keywords event,time,validation,completeness,missing,incomplete
NULL
