#'
#' Data check validation_decimallatitude_outofrange Check if decimalLatitude is within parameter range.
#'
#'     This data check answers: "Is decimalLatitude within parameter range?" question.\cr Data check will pass if \strong{The value for decimalLatitude within given numbers.} and will fail if \strong{The value for decimalLatitude is not within given numbers.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{decimalLatitude=0}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{decimalLatitude=91}, such data check would return \code{FALSE}.
#' @name dc_validation_decimallatitude_outofrange
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_decimallatitude_outofrange')
#' @section samplePassData:
#' The value for decimalLatitude within given numbers.
#' @section sampleFailData:
#' The value for decimalLatitude is not within given numbers.
#' @section targetDWCField:
#' decimalLatitude
#' @section checkCategory:
#'  location
#' @importFrom magrittr %>%
#' @export
#' @keywords space,validation,conformance
NULL
