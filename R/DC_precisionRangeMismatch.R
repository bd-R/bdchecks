#'
#' Data check precisionRangeMismatch Check if precision range mismatch is between 0 and 1
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{The coordinate precision (dwc:coordinatePrecision) is between zero (minimum) and one (maximum)} and will fail if \strong{The coordinate precision (dwc:coordinatePrecision), as a decimal representation, is outside the range of zero (minimum) and one (maximum)}.\cr Dimension of this data check is \strong{Conformance} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{coordinatePrecision=0,coordinatePrecision=0.5,coordinatePrecision=1}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{coordinatePrecision=3,coordinatePrecision=-1}, such data check would return \code{Failed}.
#' @name DC_precisionRangeMismatch
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references None
#' @examples 
#' performDC(DC = DC_precisionRangeMismatch, DATA = bdchecks::dataBats)
#' @section samplePassData:
#' The coordinate precision (dwc:coordinatePrecision) is between zero (minimum) and one (maximum)
#' @section sampleFailData:
#' The coordinate precision (dwc:coordinatePrecision), as a decimal representation, is outside the range of zero (minimum) and one (maximum)
#' @section targetDWCField:
#' coordinatePrecision
#' @section checkCategory:
#'  Location

NULL
