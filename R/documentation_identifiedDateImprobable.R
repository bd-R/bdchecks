#'
#' Data check identifiedDateImprobable 
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{} and will fail if \strong{}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name dc_identifiedDateImprobable
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references None
#' @examples 
#' performDC(DC = dc_identifiedDateImprobable, DATA = bdchecks::data_bats)
#' @section samplePassData:
#' The date of identification (dwc:dateIdentified) is post Linnaeus (1753) to the current date
#' @section sampleFailData:
#' The date of identification (dwc:dateIdentified) falls prior to Linnaeus (1753) or after the current date.
#' @section targetDWCField:
#' dateIdentified
#' @section checkCategory:
#'  Identification
#' @export

NULL
