#'
#' Data check uncertaintyRangeMismatch 
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{} and will fail if \strong{}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name dc_uncertaintyRangeMismatch
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'uncertaintyRangeMismatch')
#' @section samplePassData:
#' Geopoint uncertainty (dwc:coordinateUncertaintyInMeters) is a whole number and greater than zero (meters)
#' @section sampleFailData:
#' Geopoint uncertainty (dwc:coordinateUncertaintyInMeters) should be a whole number and greater than zero (meters)
#' @section targetDWCField:
#' coordinateUncertaintyInMeters
#' @section checkCategory:
#'  Location
#' @importFrom magrittr %>%
#' @export

NULL
