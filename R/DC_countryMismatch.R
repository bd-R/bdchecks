#'
#' Data check countryMismatch Check if given country match given country code.
#'
#'     This data check answers: "Does country and country code match??" question.\cr Data check will pass if \strong{Country name (dwc:country) and ISO country code (dwc:countryCode) match} and will fail if \strong{Country name (dwc:country) and ISO country code (dwc:countryCode) do not match}.\cr Dimension of this data check is \strong{Consistency} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{country=Australia, countryCode=AU}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{country=Australia, countryCode=4}, such data check would return \code{Failed}.
#' @name DC_countryMismatch
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references None
#' @examples 
#' performDC(DC = DC_countryMismatch, DATA = bdchecks::dataBats)
#' @section samplePassData:
#' Country name (dwc:country) and ISO country code (dwc:countryCode) match
#' @section sampleFailData:
#' Country name (dwc:country) and ISO country code (dwc:countryCode) do not match
#' @section targetDWCField:
#' country,countryCode
#' @section checkCategory:
#'  Location

NULL
