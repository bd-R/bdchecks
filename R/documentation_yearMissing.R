#'
#' Data check yearMissing 
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{} and will fail if \strong{}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name dc_yearMissing
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' performDC(data.checks@dc_body$yearMissing, data_bats)
#' @section samplePassData:
#' The value for dwc:year is valid
#' @section sampleFailData:
#' The value for dwc:year is NULL
#' @section targetDWCField:
#' year
#' @section checkCategory:
#'  Event
#' @export

NULL
