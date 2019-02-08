#'
#' Data check elevationOutOfRange Check if elevationOutOfRange is not out of range.
#'
#'     This data check answers: "Is elevation within range??" question.\cr Data check will pass if \strong{Minimum elevation in meters is greater or equal to zero and maximum elevation in meters is less than 10,000 meters} and will fail if \strong{Minimum elevation in meters is less than zero and/or maximum elevation in meters is greater than 10,000}.\cr Dimension of this data check is \strong{Likeliness} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{minimumElevationInMeters=1,maximumElevationInMeters=100}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{maximumElevationInMeters=19375}, such data check would return \code{Failed}.
#' @name DC_elevationOutOfRange
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references None
#' @examples 
#' performDC(DC = DC_elevationOutOfRange, DATA = bdchecks::dataBats)
#' @section samplePassData:
#' Minimum elevation in meters is greater or equal to zero and maximum elevation in meters is less than 10,000 meters
#' @section sampleFailData:
#' Minimum elevation in meters is less than zero and/or maximum elevation in meters is greater than 10,000
#' @section targetDWCField:
#' minimumElevationinMeters,maximumElevationInMeters
#' @section checkCategory:
#'  Location

NULL
