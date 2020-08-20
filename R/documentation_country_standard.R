#'
#' Data check country_standard Check if country is within a set of available
#' country names.
#'
#'     This data check answers: "Is country information valid?" question.\cr
#' Data check will pass if \strong{The value for country is present and
#' correct.} and will fail if \strong{The value for country is missing or
#' incorrect.}.\cr Dimension of this data check is \strong{} and it's flagging
#' type is: \strong{FLAG}\cr Example of entries that will pass:
#' \code{country=Korea}, such data check would return \code{TRUE}.\cr Example
#' of entries that will fail: \code{country=Forest}, such data check would
#' @name dc_country_standard
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'country_standard')
#' @section samplePassData:
#' The value for country is present and correct.
#' @section sampleFailData:
#' The value for country is missing or incorrect.
#' @section targetDWCField:
#' country
#' @section checkCategory:
#'  location
#' @importFrom magrittr %>%
#' @export
#' @keywords space,validation,vocabulary,parametrized
NULL
