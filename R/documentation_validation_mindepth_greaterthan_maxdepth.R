#'
#' Data check validation_mindepth_greaterthan_maxdepth Check if minimumDepthInMeters is not greater than maximumDepthInMeters.
#'
#'     This data check answers: "Is minimumDepthInMeters less or equal to maximumDepthInMeters?" question.\cr Data check will pass if \strong{Given minimumDepthInMeters is not greater than maximumDepthInMeters.} and will fail if \strong{Given minimumDepthInMeters is greater than maximumDepthInMeters.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{minimumDepthInMeters="100",maximumDepthInMeters="200"}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{minimumDepthInMeters="100",maximumDepthInMeters="20"}, such data check would return \code{FALSE}.
#' @name dc_validation_mindepth_greaterthan_maxdepth
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_mindepth_greaterthan_maxdepth')
#' @section samplePassData:
#' Given minimumDepthInMeters is not greater than maximumDepthInMeters.
#' @section sampleFailData:
#' Given minimumDepthInMeters is greater than maximumDepthInMeters.
#' @section targetDWCField:
#' minimumDepthInMeters
#' @section checkCategory:
#'  location
#' @importFrom magrittr %>%
#' @export
#' @keywords space,validation,conformance
NULL
