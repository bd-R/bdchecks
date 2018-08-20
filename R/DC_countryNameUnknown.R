#'
#' Data check countryNameUnknown Check if the name of the country or major administrative unit in which the location occurs is within given vocabulary
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{Country name (dwc:country) is in vocabulary} and will fail if \strong{Country name (dwc:country) not in vocabulary}.\cr Dimension of this data check is \strong{Conformance} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name countryNameUnknown
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references LATER
#' @section samplePassData:
#' Country name (dwc:country) is in vocabulary
#' @section sampleFailData:
#' Country name (dwc:country) not in vocabulary
#' @section targetDWCField:
#' country
#' @section checkCategory:
#'  Location

NULL
