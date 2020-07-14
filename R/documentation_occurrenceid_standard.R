#'
#' Data check occurrenceid_standard Check if occurrenceID is not empty and follows a format commonly associated with globally unique identifiers (GUID).
#'
#'     This data check answers: "Is occurrenceID a GUID?" question.\cr Data check will pass if \strong{The value for occurrenceID is guid.} and will fail if \strong{The value for occurrenceID is not guid.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{occurrenceID=9d26b451-9dad-4e27-a6e3-5b7ae332d5ed}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{occurrenceID=}, such data check would return \code{FALSE}.
#' @name dc_occurrenceid_standard
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'occurrenceid_standard')
#' @section samplePassData:
#' The value for occurrenceID is guid.
#' @section sampleFailData:
#' The value for occurrenceID is not guid.
#' @section targetDWCField:
#' occurrenceID
#' @section checkCategory:
#'  occurrence
#' @importFrom magrittr %>%
#' @export
#' @keywords other,validation,conformance,guid
NULL
