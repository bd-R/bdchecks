#'
#' Data check validation_year_empty Check if year exists and is not empty.
#'
#'     This data check answers: "Is year information present?" question.\cr Data check will pass if \strong{The value for year is present.} and will fail if \strong{The value for year is missing.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{year=2001-01-01}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{year=}, such data check would return \code{FALSE}.
#' @name dc_validation_year_empty
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_year_empty')
#' @section samplePassData:
#' The value for year is present.
#' @section sampleFailData:
#' The value for year is missing.
#' @section targetDWCField:
#' year
#' @section checkCategory:
#'  event
#' @importFrom magrittr %>%
#' @export
#' @keywords event,time,validation,completeness,missing,incomplete
NULL
