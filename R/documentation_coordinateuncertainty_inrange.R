#'
#' Data check coordinateuncertainty_inrange Check if coordinateUncertaintyInMeters is within given range.
#'
#'     This data check answers: "Is coordinateUncertaintyInMeters between 1 and upper limit?" question.\cr Data check will pass if \strong{The value for coordinateUncertaintyInMeters is within given range.} and will fail if \strong{The value for coordinateUncertaintyInMeters is not within range.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{coordinateUncertaintyInMeters=1}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{coordinateUncertaintyInMeters=-1}, such data check would return \code{FALSE}.
#' @name dc_coordinateuncertainty_inrange
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'coordinateuncertainty_inrange')
#' @section samplePassData:
#' The value for coordinateUncertaintyInMeters is within given range.
#' @section sampleFailData:
#' The value for coordinateUncertaintyInMeters is not within range.
#' @section targetDWCField:
#' coordinateUncertaintyInMeters
#' @section checkCategory:
#'  location
#' @importFrom magrittr %>%
#' @export
#' @keywords space,conformance,validation
NULL
