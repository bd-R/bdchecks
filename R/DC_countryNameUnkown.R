#'
#' Data check countryNameUnkown Checks if given country code name is known
#'
#'     This data check answers: "Is country known?" question.\cr Data check will pass if \strong{Country name (dwc:country) is in vocabulary} and will fail if \strong{Country name (dwc:country) not in vocabulary}.\cr Dimension of this data check is \strong{Conformance} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{AUS,JP}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{xxx, AUST, 1}, such data check would return \code{FALSE}.
#' @name countryNameUnkown
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references LATER
#' @keywords country, geo
NULL
