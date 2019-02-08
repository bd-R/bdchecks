#'
#' Data check coordinatePrecisionMismatch Check if decimal values given in decimalLatitude and decimalLongitude does agree witha a decimal representation of the precision of the coordinates (coordinatePrecision)
#'
#'     This data check answers: "Is decimal number in langitude and latitude not smaller than a given decimal precision??" question.\cr Data check will pass if \strong{The number of decimal places of latitude (dwc:decimalLatitude) and longitude (dwc:decimalLongitude) is in agreement with the supplied coordinate precision (dwc:coordinatePrecision)} and will fail if \strong{The number of decimal places of latitude (dwc:decimalLatitude) or longitude (dwc:decimalLongitude) is not in agreement with the supplied coordinate precision (dwc:coordinatePrecision)}.\cr Dimension of this data check is \strong{Consistency} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{coordinatePrecision=1e-5, decimalLatitude=-35.123}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{coordinatePrecision=0.5, decimalLatitude=-35.123456}, such data check would return \code{Failed}.
#' @name DC_coordinatePrecisionMismatch
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references None
#' @examples 
#' performDC(DC = DC_coordinatePrecisionMismatch, DATA = bdchecks::dataBats)
#' @section samplePassData:
#' The number of decimal places of latitude (dwc:decimalLatitude) and longitude (dwc:decimalLongitude) is in agreement with the supplied coordinate precision (dwc:coordinatePrecision)
#' @section sampleFailData:
#' The number of decimal places of latitude (dwc:decimalLatitude) or longitude (dwc:decimalLongitude) is not in agreement with the supplied coordinate precision (dwc:coordinatePrecision)
#' @section targetDWCField:
#' decimalLatitude,decimalLongitude
#' @section checkCategory:
#'  Location

NULL
