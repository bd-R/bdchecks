#'
#' Data check eventDateInFuture Check if event date is not in the future
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{dwc:eventDate is valid} and will fail if \strong{dwc:eventDate is in the future}.\cr Dimension of this data check is \strong{Conformance} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{eventDate=2001-01-01}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{eventDate=2230-12-31}, such data check would return \code{Failed}.
#' @name DC_eventDateInFuture
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references None
#' @examples 
#' performDC(DC = DC_eventDateInFuture, DATA = bdchecks::dataBats)
#' @section samplePassData:
#' dwc:eventDate is valid
#' @section sampleFailData:
#' dwc:eventDate is in the future
#' @section targetDWCField:
#' eventDate
#' @section checkCategory:
#'  Event

NULL
