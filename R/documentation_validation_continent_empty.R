#'
#' Data check validation_continent_empty Check if continent exists and is not empty.
#'
#'     This data check answers: "Is continent information present?" question.\cr Data check will pass if \strong{The value for continent is present.} and will fail if \strong{The value for continent is missing.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{continent=Australia}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{continent=}, such data check would return \code{FALSE}.
#' @name dc_validation_continent_empty
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_continent_empty')
#' @section samplePassData:
#' The value for continent is present.
#' @section sampleFailData:
#' The value for continent is missing.
#' @section targetDWCField:
#' continent
#' @section checkCategory:
#'  location
#' @importFrom magrittr %>%
#' @export
#' @keywords location,validation,completeness,missing,incomplete
NULL
