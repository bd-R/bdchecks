#'
#' Data check country_countrycode_consistent Check if country matches country code.
#'
#'     This data check answers: "Does country matches country code?" question.\cr Data check will pass if \strong{Given country matches country code.} and will fail if \strong{Given country doesn't match country code.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{country="Australia",countryCode="AU"}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{country="Australia",countryCode="GM"}, such data check would return \code{FALSE}.
#' @name dc_country_countrycode_consistent
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'country_countrycode_consistent')
#' @section samplePassData:
#' Given country matches country code.
#' @section sampleFailData:
#' Given country doesn't match country code.
#' @section targetDWCField:
#' country
#' @section checkCategory:
#'  location
#' @importFrom magrittr %>%
#' @export
#' @keywords space,validation,conformance
NULL
