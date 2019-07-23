#'
#' Data check uncertaintyRangeMismatch Check if geopoint uncertainty range mismatch is a positive integer (meters).
#'
#'     This data check answers: "Is uncertainty mismatch is an intiger greater than zero?" question.\cr Data check will pass if \strong{Geopoint uncertainty (dwc:coordinateUncertaintyInMeters) is a whole number and greater than zero (meters)} and will fail if \strong{Geopoint uncertainty (dwc:coordinateUncertaintyInMeters) should be a whole number and greater than zero (meters)}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{coordinateUncertaintyInMeters=1}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{coordinateUncertaintyInMeters=0.002,coordinateUncertaintyInMeters=-1,coordinateUncertaintyInMeters=0}, such data check would return \code{Failed}.
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
