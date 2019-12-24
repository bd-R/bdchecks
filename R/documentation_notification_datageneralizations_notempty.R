#'
#' Data check notification_datageneralizations_notempty Check if dataGeneralizations is not empty.
#'
#'     This data check answers: "Is dataGeneralizations information present?" question.\cr Data check will pass if \strong{The value for dataGeneralizations is not empty.} and will fail if \strong{The value for dataGeneralizations is not reported.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{dataGeneralizations=record placed on 0.1 degree grid}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{dataGeneralizations=}, such data check would return \code{FALSE}.
#' @name dc_notification_datageneralizations_notempty
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'notification_datageneralizations_notempty')
#' @section samplePassData:
#' The value for dataGeneralizations is not empty.
#' @section sampleFailData:
#' The value for dataGeneralizations is not reported.
#' @section targetDWCField:
#' dataGeneralizations
#' @section checkCategory:
#'  record-level terms
#' @importFrom magrittr %>%
#' @export
#' @keywords notificaton,resolution,space,time,name
NULL
