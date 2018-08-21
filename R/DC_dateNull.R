#'
#' Data check dateNull Check if eventDate, year, verbatimEventDate are not NULL
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{Date information is present} and will fail if \strong{No date information}.\cr Dimension of this data check is \strong{Completeness} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name DC_dateNull
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references LATER
#' @section samplePassData:
#' Date information is present
#' @section sampleFailData:
#' No date information
#' @section targetDWCField:
#' eventDate,year,verbatimEventDate
#' @section checkCategory:
#'  Event

NULL
