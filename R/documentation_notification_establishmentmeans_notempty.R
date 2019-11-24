#'
#' Data check notification_establishmentmeans_notempty Check if establishmentMeans is not empty.
#'
#'     This data check answers: "Is establishmentMeans information present?" question.\cr Data check will pass if \strong{The value for establishmentMeans is not empty.} and will fail if \strong{The value for establishmentMeans is not reported.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{establishmentMeans=cultivated}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{establishmentMeans=}, such data check would return \code{FALSE}.
#' @name dc_notification_establishmentmeans_notempty
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'notification_establishmentmeans_notempty')
#' @section samplePassData:
#' The value for establishmentMeans is not empty.
#' @section sampleFailData:
#' The value for establishmentMeans is not reported.
#' @section targetDWCField:
#' establishmentMeans
#' @section checkCategory:
#'  occurrence
#' @importFrom magrittr %>%
#' @export
#' @keywords other,notificaton,completness
NULL
