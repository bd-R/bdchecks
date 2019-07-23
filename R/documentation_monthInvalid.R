#'
#' Data check monthInvalid 
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{} and will fail if \strong{}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name dc_monthInvalid
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'monthInvalid')
#' @section samplePassData:
#' The event month is between 1 and 12
#' @section sampleFailData:
#' The event month is less than 1 or is greater than 12
#' @section targetDWCField:
#' month
#' @section checkCategory:
#'  Event
#' @importFrom magrittr %>%
#' @export

NULL
