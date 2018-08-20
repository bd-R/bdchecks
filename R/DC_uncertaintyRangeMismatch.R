#'
#' Data check uncertaintyRangeMismatch Check if geopoint uncertainty range mismatch is a positive integer (meters).
#'
#'     This data check answers: "Is uncertainty mismatch is an intiger greater than zero??" question.\cr Data check will pass if \strong{Geopoint uncertainty (dwc:coordinateUncertaintyInMeters) is a whole number and greater than zero (meters)} and will fail if \strong{Geopoint uncertainty (dwc:coordinateUncertaintyInMeters) should be a whole number and greater than zero (meters)}.\cr Dimension of this data check is \strong{Conformance} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name uncertaintyRangeMismatch
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references LATER
#' @section samplePassData:
#' Geopoint uncertainty (dwc:coordinateUncertaintyInMeters) is a whole number and greater than zero (meters)
#' @section sampleFailData:
#' Geopoint uncertainty (dwc:coordinateUncertaintyInMeters) should be a whole number and greater than zero (meters)
#' @section targetDWCField:
#' coordinateUncertaintyInMeters
#' @section checkCategory:
#'  Location

NULL
