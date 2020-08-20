#'
#' Data check occurrenceid_present Check if occurrenceID exists and is not
#' empty.
#'
#'     This data check answers: "Is occurrenceID information present?"
#' question.\cr Data check will pass if \strong{The value for occurrenceID is
#' present.} and will fail if \strong{The value for occurrenceID is
#' missing.}.\cr Dimension of this data check is \strong{} and it's flagging
#' type is: \strong{FLAG}\cr Example of entries that will pass:
#' \code{occurrenceID=urn:lsid:nhm.ku.edu:Herps:32}, such data check would
#' return \code{TRUE}.\cr Example of entries that will fail:
#' @name dc_occurrenceid_present
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'occurrenceid_present')
#' @section samplePassData:
#' The value for occurrenceID is present.
#' @section sampleFailData:
#' The value for occurrenceID is missing.
#' @section targetDWCField:
#' occurrenceID
#' @section checkCategory:
#'  record-level terms
#' @importFrom magrittr %>%
#' @export
#' @keywords other,validation,completeness,missing,incomplete
NULL
