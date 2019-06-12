#'
#' Data check dateNull 
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{} and will fail if \strong{}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name dc_dateNull
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references None
#' @examples 
#' performDC(DC = dc_dateNull, DATA = bdchecks::data_bats)
#' @section samplePassData:
#' Date information is present
#' @section sampleFailData:
#' No date information
#' @section targetDWCField:
#' eventDate,year,verbatimEventDate
#' @section checkCategory:
#'  Event
#' @export

NULL
