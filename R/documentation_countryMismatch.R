#'
#' Data check countryMismatch 
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{} and will fail if \strong{}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name dc_countryMismatch
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' performDC(data.checks@dc_body$countryMismatch, data_bats)
#' @section samplePassData:
#' Country name (dwc:country) and ISO country code (dwc:countryCode) match
#' @section sampleFailData:
#' Country name (dwc:country) and ISO country code (dwc:countryCode) do not match
#' @section targetDWCField:
#' country,countryCode
#' @section checkCategory:
#'  Location
#' @export

NULL
