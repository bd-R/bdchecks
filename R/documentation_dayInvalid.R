#'
#' Data check dayInvalid 
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{} and will fail if \strong{}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name dc_dayInvalid
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'dayInvalid')
#' @section samplePassData:
#' The value given for event day is between 1 and 31
#' @section sampleFailData:
#' The value given for event day is less than 1 or greater than 31
#' @section targetDWCField:
#' day
#' @section checkCategory:
#'  Event
#' @importFrom magrittr %>%
#' @export

NULL
