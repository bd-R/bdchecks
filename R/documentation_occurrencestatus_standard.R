#'
#' Data check occurrencestatus_standard Check if occurrenceStatus is
#' specified source authority service.
#'
#'     This data check answers: "Is occurrenceStatus within given source
#' authority list?" question.\cr Data check will pass if \strong{The value for
#' occurrenceStatus is present and correct.} and will fail if \strong{The value
#' for occurrenceStatus is missing or incorrect.}.\cr Dimension of this data
#' check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of
#' entries that will pass: \code{occurrenceStatus=present}, such data check
#' would return \code{TRUE}.\cr Example of entries that will fail:
#' \code{occurrenceStatus=observed}, such data check would return
#' @name dc_occurrencestatus_standard
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'occurrencestatus_standard')
#' @section samplePassData:
#' The value for occurrenceStatus is present and correct.
#' @section sampleFailData:
#' The value for occurrenceStatus is missing or incorrect.
#' @section targetDWCField:
#' occurrenceStatus
#' @section checkCategory:
#'  occurrence
#' @importFrom magrittr %>%
#' @export
#' @keywords vocabulary,validation
NULL
