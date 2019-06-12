#'
#' Data check elevationOutOfRange 
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{} and will fail if \strong{}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name dc_elevationOutOfRange
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references None
#' @examples 
#' performDC(DC = dc_elevationOutOfRange, DATA = bdchecks::data_bats)
#' @section samplePassData:
#' Minimum elevation in meters is greater or equal to zero and maximum elevation in meters is less than 10,000 meters
#' @section sampleFailData:
#' Minimum elevation in meters is less than zero and/or maximum elevation in meters is greater than 10,000
#' @section targetDWCField:
#' minimumElevationinMeters,maximumElevationInMeters
#' @section checkCategory:
#'  Location
#' @export

NULL
