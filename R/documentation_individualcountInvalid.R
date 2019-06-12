#'
#' Data check individualcountInvalid 
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{} and will fail if \strong{}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name dc_individualcountInvalid
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references None
#' @examples 
#' performDC(DC = dc_individualcountInvalid, DATA = bdchecks::data_bats)
#' @section samplePassData:
#' The count of individuals is a valid integer
#' @section sampleFailData:
#' The count of individuals is not an integer and therefore invalid
#' @section targetDWCField:
#' individualCount
#' @section checkCategory:
#'  Occurrence
#' @export

NULL
