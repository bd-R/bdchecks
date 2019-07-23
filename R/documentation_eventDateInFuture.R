#'
#' Data check eventDateInFuture Check if event date is not in the future
#'
#'     This data check answers: "Is event date not in the future?" question.\cr Data check will pass if \strong{dwc:eventDate is valid} and will fail if \strong{dwc:eventDate is in the future}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{eventDate=2001-01-01}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{eventDate=2230-12-31}, such data check would return \code{Failed}.
#' @name dc_eventDateInFuture
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'eventDateInFuture')
#' @section samplePassData:
#' dwc:eventDate is valid
#' @section sampleFailData:
#' dwc:eventDate is in the future
#' @section targetDWCField:
#' eventDate
#' @section checkCategory:
#'  Event
#' @importFrom magrittr %>%
#' @export

NULL
