#'
#' Data check validation_minelevation_greaterthan_maxelevation Check if minimumElevationInMeters is not greater than maximumElevationInMeters.
#'
#'     This data check answers: "Is minimumElevationInMeters less or equal to maximumElevationInMeters?" question.\cr Data check will pass if \strong{Given minimumElevationInMeters is not greater than maximumElevationInMeters.} and will fail if \strong{Given minimumElevationInMeters is greater than maximumElevationInMeters.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{minimumElevationInMeters="100",maximumElevationInMeters="200"}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{minimumElevationInMeters="100",maximumElevationInMeters="20"}, such data check would return \code{FALSE}.
#' @name dc_validation_minelevation_greaterthan_maxelevation
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_minelevation_greaterthan_maxelevation')
#' @section samplePassData:
#' Given minimumElevationInMeters is not greater than maximumElevationInMeters.
#' @section sampleFailData:
#' Given minimumElevationInMeters is greater than maximumElevationInMeters.
#' @section targetDWCField:
#' minimumElevationInMeters
#' @section checkCategory:
#'  location
#' @importFrom magrittr %>%
#' @export
#' @keywords space,validation,conformance
NULL
