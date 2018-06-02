#'
#' Data check countryNameUnkown Checks if given country code name is known
#'
#'     This data check answers: "Is country known?" question.\cr Data check will pass if strong{Country name (dwc:country) is in vocabulary}and fail if strong{Country name (dwc:country) not in vocabulary}.\cr Dimension of this data check is strong{Conformance}and it's flagging type is: strong{FLAG}\cr Example of entries that will pass:AUS,JP\cr Passed data check will generate:TRUEoutput.\cr Example of entries that will fail:xxx, AUST, 1\cr Failed data check will generate:FALSEoutput.
#' @name countryNameUnkown
#' @docType data
#' @format An object of class \code{"dataCheck"}, see\code{\link{dataCheck}} for details.
#' @references LATER
#' @keywords country, geo
NULL
