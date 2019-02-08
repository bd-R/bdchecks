#'
#' Data check dateNull Check if eventDate, year, verbatimEventDate are not NULL
#'
#'     This data check answers: "Is eventDate, year or verbatimEventDate not NULL??" question.\cr Data check will pass if \strong{Date information is present} and will fail if \strong{No date information}.\cr Dimension of this data check is \strong{Completeness} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{year=2000 + eventDate=2000.01.01 + verbatimEventDate=2000.01.01}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{year=NULL + eventDate=NULL + verbatimEventDate=NULL}, such data check would return \code{Failed}.
#' @name DC_dateNull
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references None
#' @examples 
#' performDC(DC = DC_dateNull, DATA = bdchecks::dataBats)
#' @section samplePassData:
#' Date information is present
#' @section sampleFailData:
#' No date information
#' @section targetDWCField:
#' eventDate,year,verbatimEventDate
#' @section checkCategory:
#'  Event

NULL
