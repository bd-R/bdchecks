#'
#' Data check dateIdentifiedInFuture 
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{} and will fail if \strong{}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name dc_dateIdentifiedInFuture
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references None
#' @examples 
#' performDC(DC = dc_dateIdentifiedInFuture, DATA = bdchecks::data_bats)
#' @section samplePassData:
#' Date (dwc:dateIdentified) is not in the future
#' @section sampleFailData:
#' Date (dwc:dateIdentified) is in the future
#' @section targetDWCField:
#' dateIdentified
#' @section checkCategory:
#'  Identification
#' @export

NULL
