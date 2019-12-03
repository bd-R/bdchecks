#'
#' Data check validation_decimallongitude_outofrange Check if decimalLongitude is within parameter range.
#'
#'     This data check answers: "Is decimalLongitude within parameter range?" question.\cr Data check will pass if \strong{The value for decimalLongitude within given numbers.} and will fail if \strong{The value for decimalLongitude is not within given numbers.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{decimalLongitude=0}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{decimalLongitude=181}, such data check would return \code{FALSE}.
#' @name dc_validation_decimallongitude_outofrange
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_decimallongitude_outofrange')
#' @section samplePassData:
#' The value for decimalLongitude within given numbers.
#' @section sampleFailData:
#' The value for decimalLongitude is not within given numbers.
#' @section targetDWCField:
#' decimalLongitude
#' @section checkCategory:
#'  location
#' @importFrom magrittr %>%
#' @export
#' @keywords space,validation,conformance
NULL
