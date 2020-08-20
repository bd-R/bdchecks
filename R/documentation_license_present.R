#'
#' Data check license_present Check if license exists and is not empty.
#' 
#'
#'     This data check answers: "Is license information present?"
#' question.\cr Data check will pass if \strong{The value for license is
#' present.} and will fail if \strong{The value for license is missing.}.\cr
#' Dimension of this data check is \strong{} and it's flagging type is:
#' \strong{FLAG}\cr Example of entries that will pass: \code{license=GPL},
#' such data check would return \code{TRUE}.\cr Example of entries that will
#' @name dc_license_present
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'license_present')
#' @section samplePassData:
#' The value for license is present.
#' @section sampleFailData:
#' The value for license is missing.
#' @section targetDWCField:
#' license
#' @section checkCategory:
#'  record-level terms
#' @importFrom magrittr %>%
#' @export
#' @keywords other,validation,completeness,missing,incomplete
NULL
