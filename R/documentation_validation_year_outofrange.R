#'
#' Data check validation_year_outofrange Check if year is not empty and is within given earliest and latest dates.
#'
#'     This data check answers: "Is year within given dates?" question.\cr Data check will pass if \strong{The value for year within given dates.} and will fail if \strong{The value for year is not within given dates.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{year=2000}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{year=3000}, such data check would return \code{FALSE}.
#' @name dc_validation_year_outofrange
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_year_outofrange')
#' @section samplePassData:
#' The value for year within given dates.
#' @section sampleFailData:
#' The value for year is not within given dates.
#' @section targetDWCField:
#' year
#' @section checkCategory:
#'  event
#' @importFrom magrittr %>%
#' @export
#' @keywords time,validation,conformance
NULL
