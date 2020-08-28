#'
#' Data check decimallatitude_present Check if decimalLatitude exists and is
#' not empty.
#'
#'     This data check answers: "Is decimalLatitude information present?"
#' question.\cr Data check will pass if \strong{The value for decimalLatitude
#' is present.} and will fail if \strong{The value for decimalLatitude is
#' missing.}.\cr Dimension of this data check is \strong{} and it's flagging
#' type is: \strong{FLAG}\cr Example of entries that will pass:
#' \code{decimalLatitude=-41.0983423}, such data check would return
#' \code{TRUE}.\cr Example of entries that will fail:
#' \code{decimalLatitude=}, such data check would return \code{FALSE}.
#' @name dc_decimallatitude_present
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'decimallatitude_present')
#' @section samplePassData:
#' The value for decimalLatitude is present.
#' @section sampleFailData:
#' The value for decimalLatitude is missing.
#' @section targetDWCField:
#' decimalLatitude
#' @section checkCategory:
#'  location
#' @importFrom magrittr %>%
#' @export
#' @keywords location,validation,completeness,missing,incomplete
NULL
