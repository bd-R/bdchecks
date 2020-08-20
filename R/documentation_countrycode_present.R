#'
#' Data check countrycode_present Check if countryCode exists and is not
#' empty.
#'
#'     This data check answers: "Is countryCode information present?"
#' question.\cr Data check will pass if \strong{The value for countryCode is
#' present.} and will fail if \strong{The value for countryCode is
#' missing.}.\cr Dimension of this data check is \strong{} and it's flagging
#' type is: \strong{FLAG}\cr Example of entries that will pass:
#' \code{countryCode=AU}, such data check would return \code{TRUE}.\cr
#' Example of entries that will fail: \code{countryCode=}, such data check
#' @name dc_countrycode_present
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'countrycode_present')
#' @section samplePassData:
#' The value for countryCode is present.
#' @section sampleFailData:
#' The value for countryCode is missing.
#' @section targetDWCField:
#' countryCode
#' @section checkCategory:
#'  location
#' @importFrom magrittr %>%
#' @export
#' @keywords location,validation,completeness,missing,incomplete
NULL
