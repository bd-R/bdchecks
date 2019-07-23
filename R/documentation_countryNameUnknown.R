#'
#' Data check countryNameUnknown Check if the name of the country or major administrative unit in which the location occurs is within given vocabulary
#'
#'     This data check answers: "Is country known?" question.\cr Data check will pass if \strong{Country name (dwc:country) is in vocabulary} and will fail if \strong{Country name (dwc:country) not in vocabulary}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{country=Australia}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{country=Austend}, such data check would return \code{Failed}.
#' @name dc_countryNameUnknown
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'countryNameUnknown')
#' @section samplePassData:
#' Country name (dwc:country) is in vocabulary
#' @section sampleFailData:
#' Country name (dwc:country) not in vocabulary
#' @section targetDWCField:
#' country
#' @section checkCategory:
#'  Location
#' @importFrom magrittr %>%
#' @export

NULL
