#'
#' Data check validation_occurrencestatus_empty Check if occurrenceStatus exists and is not empty.
#'
#'     This data check answers: "Is occurrenceStatus information present?" question.\cr Data check will pass if \strong{The value for occurrenceStatus is present.} and will fail if \strong{The value for occurrenceStatus is missing.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{occurrenceStatus=present}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{occurrenceStatus=}, such data check would return \code{FALSE}.
#' @name dc_validation_occurrencestatus_empty
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_occurrencestatus_empty')
#' @section samplePassData:
#' The value for occurrenceStatus is present.
#' @section sampleFailData:
#' The value for occurrenceStatus is missing.
#' @section targetDWCField:
#' occurrenceStatus
#' @section checkCategory:
#'  Record-level Terms
#' @importFrom magrittr %>%
#' @export
#' @keywords other,validation,completness,missing,incomplete
NULL
