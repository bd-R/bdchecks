#'
#' Data check eventdate_inrange Check if eventDate is not empty and is within given earliest and latest dates.
#'
#'     This data check answers: "Is eventDate within given dates?" question.\cr Data check will pass if \strong{The value for eventDate within given dates.} and will fail if \strong{The value for eventDate is not within given dates.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{eventDate=2001-01-01}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{eventDate=2230-12-31}, such data check would return \code{FALSE}.
#' @name dc_eventdate_inrange
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'eventdate_inrange')
#' @section samplePassData:
#' The value for eventDate within given dates.
#' @section sampleFailData:
#' The value for eventDate is not within given dates.
#' @section targetDWCField:
#' eventDate
#' @section checkCategory:
#'  event
#' @importFrom magrittr %>%
#' @export
#' @keywords time,validation,conformance
NULL
