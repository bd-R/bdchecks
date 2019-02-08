#'
#' Data check dateIdentifiedInFuture Check if record identification date is not in the future
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{Date (dwc:dateIdentified) is not in the future} and will fail if \strong{Date (dwc:dateIdentified) is in the future}.\cr Dimension of this data check is \strong{Conformance} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{dateIdentified <= TODAY}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{dateIdentified > TODAY}, such data check would return \code{Failed}.
#' @name DC_dateIdentifiedInFuture
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references None
#' @examples 
#' performDC(DC = DC_dateIdentifiedInFuture, DATA = bdchecks::dataBats)
#' @section samplePassData:
#' Date (dwc:dateIdentified) is not in the future
#' @section sampleFailData:
#' Date (dwc:dateIdentified) is in the future
#' @section targetDWCField:
#' dateIdentified
#' @section checkCategory:
#'  Identification

NULL
