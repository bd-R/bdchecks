#'
#' Data check yearMissing Check if year information is not missing
#'
#'     This data check answers: "Is year information present??" question.\cr Data check will pass if \strong{The value for dwc:year is valid} and will fail if \strong{The value for dwc:year is NULL}.\cr Dimension of this data check is \strong{Completeness} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{year=2000}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{year=}, such data check would return \code{Faield}.
#' @name DC_yearMissing
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references None
#' @examples 
#' performDC(DC = DC_yearMissing, DATA = bdchecks::dataBats)
#' @section samplePassData:
#' The value for dwc:year is valid
#' @section sampleFailData:
#' The value for dwc:year is NULL
#' @section targetDWCField:
#' year
#' @section checkCategory:
#'  Event

NULL
