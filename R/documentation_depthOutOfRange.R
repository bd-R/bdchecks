#'
#' Data check depthOutOfRange 
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{} and will fail if \strong{}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name dc_depthOutOfRange
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'depthOutOfRange')
#' @section samplePassData:
#' Minimum depth is greater than or equal to zero (0) and maximum depth is less than 11,000 meters
#' @section sampleFailData:
#' Minimum depth is less than zero (0) or maximum depth is greater than 11,000 meters
#' @section targetDWCField:
#' minimumDepthInMeters,maximumDepthInMeters
#' @section checkCategory:
#'  Location
#' @export

NULL
