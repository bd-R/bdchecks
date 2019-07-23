#'
#' Data check coordinatePrecisionMismatch 
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{} and will fail if \strong{}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name dc_coordinatePrecisionMismatch
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'coordinatePrecisionMismatch')
#' @section samplePassData:
#' The number of decimal places of latitude (dwc:decimalLatitude) and longitude (dwc:decimalLongitude) is in agreement with the supplied coordinate precision (dwc:coordinatePrecision)
#' @section sampleFailData:
#' The number of decimal places of latitude (dwc:decimalLatitude) or longitude (dwc:decimalLongitude) is not in agreement with the supplied coordinate precision (dwc:coordinatePrecision)
#' @section targetDWCField:
#' decimalLatitude,decimalLongitude
#' @section checkCategory:
#'  Location
#' @importFrom magrittr %>%
#' @export

NULL
