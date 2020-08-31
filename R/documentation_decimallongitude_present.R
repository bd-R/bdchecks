#'
#' Data check decimallongitude_present Check if decimalLongitude exists and
#' is not empty.
#'
#'     This data check answers: "Is decimalLongitude information present?"
#' question.\cr Data check will pass if \strong{The value for decimalLongitude
#' is present.} and will fail if \strong{The value for decimalLongitude is
#' missing.}.\cr Dimension of this data check is \strong{} and it's flagging
#' type is: \strong{FLAG}\cr Example of entries that will pass:
#' \code{decimalLongitude=-41.0983423}, such data check would return
#' \code{TRUE}.\cr Example of entries that will fail:
#' \code{decimalLongitude=}, such data check would return \code{FALSE}.
#' @name dc_decimallongitude_present
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'decimallongitude_present')
#' @section samplePassData:
#' The value for decimalLongitude is present.
#' @section sampleFailData:
#' The value for decimalLongitude is missing.
#' @section targetDWCField:
#' decimalLongitude
#' @section checkCategory:
#'  location
#' @importFrom magrittr %>%
#' @export
#' @keywords location,validation,completeness,missing,incomplete
NULL
