#'
#' Data check monthInvalid Check if event month is valid (1 <= integer <= 12)
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{The event month is between 1 and 12} and will fail if \strong{The event month is less than 1 or is greater than 12}.\cr Dimension of this data check is \strong{Conformance} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{month=1}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{month=14,month=0}, such data check would return \code{Failed}.
#' @name DC_monthInvalid
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references None
#' @examples 
#' performDC(DC = DC_monthInvalid, DATA = bdchecks::dataBats)
#' @section samplePassData:
#' The event month is between 1 and 12
#' @section sampleFailData:
#' The event month is less than 1 or is greater than 12
#' @section targetDWCField:
#' month
#' @section checkCategory:
#'  Event

NULL
