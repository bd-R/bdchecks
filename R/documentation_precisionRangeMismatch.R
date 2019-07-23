#'
#' Data check precisionRangeMismatch 
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{} and will fail if \strong{}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
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
