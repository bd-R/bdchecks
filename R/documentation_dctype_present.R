#'
#' Data check dctype_present Check if dctype exists and is not empty.
#' 
#'
#'     This data check answers: "Is dctype information present?"
#' question.\cr Data check will pass if \strong{The value for dctype is
#' present.} and will fail if \strong{The value for dctype is missing.}.\cr
#' Dimension of this data check is \strong{} and it's flagging type is:
#' \strong{FLAG}\cr Example of entries that will pass: \code{dctype=Image},
#' such data check would return \code{TRUE}.\cr Example of entries that will
#' fail: \code{dctype=}, such data check would return \code{FALSE}.
#' @name dc_dctype_present
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'dctype_present')
#' @section samplePassData:
#' The value for dctype is present.
#' @section sampleFailData:
#' The value for dctype is missing.
#' @section targetDWCField:
#' type
#' @section checkCategory:
#'  record-level terms
#' @importFrom magrittr %>%
#' @export
#' @keywords other,validation,completeness,missing,incomplete
NULL
