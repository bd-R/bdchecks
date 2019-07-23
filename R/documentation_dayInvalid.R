#'
#' Data check dayInvalid Check if event day is valid (1 <= integer <= 31)
#'
#'     This data check answers: "Is event day valid?" question.\cr Data check will pass if \strong{The value given for event day is between 1 and 31} and will fail if \strong{The value given for event day is less than 1 or greater than 31}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{day=1,day=31}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{day=32,day=0,day=1.1,day=-1}, such data check would return \code{Failed}.
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
