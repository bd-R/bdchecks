#'
#' Data check precisionRangeMismatch Check if precision range mismatch is between 0 and 1
#'
#'     This data check answers: "Is range mismatch between 0 and 1?" question.\cr Data check will pass if \strong{The coordinate precision (dwc:coordinatePrecision) is between zero (minimum) and one (maximum)} and will fail if \strong{The coordinate precision (dwc:coordinatePrecision), as a decimal representation, is outside the range of zero (minimum) and one (maximum)}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{coordinatePrecision=0,coordinatePrecision=0.5,coordinatePrecision=1}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{coordinatePrecision=3,coordinatePrecision=-1}, such data check would return \code{Failed}.
#' @name dc_precisionRangeMismatch
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'precisionRangeMismatch')
#' @section samplePassData:
#' The coordinate precision (dwc:coordinatePrecision) is between zero (minimum) and one (maximum)
#' @section sampleFailData:
#' The coordinate precision (dwc:coordinatePrecision), as a decimal representation, is outside the range of zero (minimum) and one (maximum)
#' @section targetDWCField:
#' coordinatePrecision
#' @section checkCategory:
#'  Location
#' @importFrom magrittr %>%
#' @export

NULL
