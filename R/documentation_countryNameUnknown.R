#'
#' Data check countryNameUnknown 
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{} and will fail if \strong{}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name dc_countryNameUnknown
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' performDC(data.checks@dc_body$countryNameUnknown, data_bats)
#' @section samplePassData:
#' Country name (dwc:country) is in vocabulary
#' @section sampleFailData:
#' Country name (dwc:country) not in vocabulary
#' @section targetDWCField:
#' country
#' @section checkCategory:
#'  Location
#' @export

NULL
