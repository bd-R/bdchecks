#'
#' Data check dateIdentifiedInFuture Check if record identification date is not in the future
#'
#'     This data check answers: "Is record identified in the past??" question.\cr Data check will pass if \strong{Date (dwc:dateIdentified) is not in the future} and will fail if \strong{Date (dwc:dateIdentified) is in the future}.\cr Dimension of this data check is \strong{Conformance} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name dateIdentifiedInFuture
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references LATER
#' @section samplePassData:
#' Date (dwc:dateIdentified) is not in the future
#' @section sampleFailData:
#' Date (dwc:dateIdentified) is in the future
#' @section targetDWCField:
#' dateIdentified
#' @section checkCategory:
#'  Identification

NULL
