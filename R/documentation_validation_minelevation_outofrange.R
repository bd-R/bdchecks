#'
#' Data check validation_minelevation_outofrange Check if minimumElevationInMeters is within parameter range>
#'
#'     This data check answers: "Is minimumElevationInMeters within parameter range?" question.\cr Data check will pass if \strong{The value for minimumElevationInMeters within given numbers.} and will fail if \strong{The value for minimumElevationInMeters is not within given numbers.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{minimumElevationInMeters=0}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{minimumElevationInMeters=9999}, such data check would return \code{FALSE}.
#' @name dc_validation_minelevation_outofrange
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_minelevation_outofrange')
#' @section samplePassData:
#' The value for minimumElevationInMeters within given numbers.
#' @section sampleFailData:
#' The value for minimumElevationInMeters is not within given numbers.
#' @section targetDWCField:
#' minimumElevationInMeters
#' @section checkCategory:
#'  location
#' @importFrom magrittr %>%
#' @export
#' @keywords space,validation,conformance
NULL
