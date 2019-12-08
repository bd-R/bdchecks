#'
#' Data check validation_mindepth_maxdepth_outofrange Check if minimumDepthInMeters and maximumDepthInMeters is within parameter range.
#'
#'     This data check answers: "Are minimumDepthInMeters and maximumDepthInMeters within parameter range?" question.\cr Data check will pass if \strong{Values for minimumDepthInMeters and maximumDepthInMeters are within given numbers.} and will fail if \strong{Values for minimumDepthInMeters and maximumDepthInMeters are not within given numbers.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{maximumDepthInMeters=100}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{maximumDepthInMeters=20000}, such data check would return \code{FALSE}.
#' @name dc_validation_mindepth_maxdepth_outofrange
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_mindepth_maxdepth_outofrange')
#' @section samplePassData:
#' Values for minimumDepthInMeters and maximumDepthInMeters are within given numbers.
#' @section sampleFailData:
#' Values for minimumDepthInMeters and maximumDepthInMeters are not within given numbers.
#' @section targetDWCField:
#' minimumDepthInMeters,maximumDepthInMeters
#' @section checkCategory:
#'  location
#' @importFrom magrittr %>%
#' @export
#' @keywords space,validation
NULL
