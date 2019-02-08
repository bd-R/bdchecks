#'
#' Data check depthOutOfRange Check if depthOutOfRange is not out of range.
#'
#'     This data check answers: "Is depth within range??" question.\cr Data check will pass if \strong{Minimum depth is greater than or equal to zero (0) and maximum depth is less than 11,000 meters} and will fail if \strong{Minimum depth is less than zero (0) or maximum depth is greater than 11,000 meters}.\cr Dimension of this data check is \strong{Likeliness} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{minimumDepthInMeters=1,maximumDepthInMeters=100}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{maximumDepthInMeters=19380}, such data check would return \code{Failed}.
#' @name DC_depthOutOfRange
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references None
#' @examples 
#' performDC(DC = DC_depthOutOfRange, DATA = bdchecks::dataBats)
#' @section samplePassData:
#' Minimum depth is greater than or equal to zero (0) and maximum depth is less than 11,000 meters
#' @section sampleFailData:
#' Minimum depth is less than zero (0) or maximum depth is greater than 11,000 meters
#' @section targetDWCField:
#' minimumDepthInMeters,maximumDepthInMeters
#' @section checkCategory:
#'  Location

NULL
