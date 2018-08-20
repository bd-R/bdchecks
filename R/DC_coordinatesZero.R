#'
#' Data check coordinatesZero Check if decimal values given in decimalLatitude and decimalLongitude are not zero
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{Decimal latitude and longitude are not zero (0) degrees} and will fail if \strong{Decimal latitude and longitude are both zero (0) degrees}.\cr Dimension of this data check is \strong{Conformance} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name coordinatesZero
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references LATER
#' @section samplePassData:
#' Decimal latitude and longitude are not zero (0) degrees
#' @section sampleFailData:
#' Decimal latitude and longitude are both zero (0) degrees
#' @section targetDWCField:
#' decimalLatitude,decimalLongitude
#' @section checkCategory:
#'  Location

NULL
