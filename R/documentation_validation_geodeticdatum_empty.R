#'
#' Data check validation_geodeticdatum_empty Check if geodeticDatum exists and is not empty.
#'
#'     This data check answers: "Is geodeticDatum information present?" question.\cr Data check will pass if \strong{The value for geodeticDatum is present.} and will fail if \strong{The value for geodeticDatum is missing.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{geodeticDatum=WGS84}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{geodeticDatum=}, such data check would return \code{FALSE}.
#' @name dc_validation_geodeticdatum_empty
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_geodeticdatum_empty')
#' @section samplePassData:
#' The value for geodeticDatum is present.
#' @section sampleFailData:
#' The value for geodeticDatum is missing.
#' @section targetDWCField:
#' geodeticDatum
#' @section checkCategory:
#'  location
#' @importFrom magrittr %>%
#' @export
#' @keywords location,validation,completness,missing,incomplete
NULL
