#'
#' Data check validation_eventdate_empty Check if eventDate exists and is not empty.
#'
#'     This data check answers: "Is eventDate information present?" question.\cr Data check will pass if \strong{The value for eventDate is present.} and will fail if \strong{The value for eventDate is missing.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{eventDate=2001-01-01}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{eventDate=}, such data check would return \code{FALSE}.
#' @name dc_validation_eventdate_empty
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_eventdate_empty')
#' @section samplePassData:
#' The value for eventDate is present.
#' @section sampleFailData:
#' The value for eventDate is missing.
#' @section targetDWCField:
#' eventDate
#' @section checkCategory:
#'  event
#' @importFrom magrittr %>%
#' @export
#' @keywords event,time,validation,completeness,missing,incomplete
NULL
