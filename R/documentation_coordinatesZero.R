#'
#' Data check coordinatesZero 
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{} and will fail if \strong{}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name dc_coordinatesZero
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references None
#' @examples 
#' performDC(DC = dc_coordinatesZero, DATA = bdchecks::data_bats)
#' @section samplePassData:
#' Decimal latitude and longitude are not zero (0) degrees
#' @section sampleFailData:
#' Decimal latitude and longitude are both zero (0) degrees
#' @section targetDWCField:
#' decimalLatitude,decimalLongitude
#' @section checkCategory:
#'  Location
#' @export

NULL
