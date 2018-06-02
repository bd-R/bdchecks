#'
#' Data check countryMismatch Checks if country name matchs ISO code
#'
#'     This data check answers: "Does contry name match country code?" question.\cr Data check will pass if \strong{Country name (dwc:country) and ISO country code (dwc:countryCode) match} and will fail if \strong{Country name (dwc:country) and ISO country code (dwc:countryCode) do not match}.\cr Dimension of this data check is \strong{Consistency} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{AUS AUS, JP JP}, such data check will return \code{TRUE}.\cr Example of entries that will fail: \code{AUS AUST, AUS JP}, such data check will return \code{FALSE}.
#' @name countryMismatch
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references LATER
#' @keywords country, geo
NULL
