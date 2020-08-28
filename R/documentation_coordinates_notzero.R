#'
#' Data check coordinates_notzero Check if decimalLatitude or
#' decimalLongitude are not zeroes.
#'
#'     This data check answers: "Are coordinates not equal to zero."
#' question.\cr Data check will pass if \strong{The value for decimalLatitude
#' is not equal to 0.} and will fail if \strong{The value for decimalLatitude
#' is equal to 0.}.\cr Dimension of this data check is \strong{} and it's
#' flagging type is: \strong{FLAG}\cr Example of entries that will pass:
#' \code{decimalLatitude=1}, such data check would return \code{TRUE}.\cr
#' Example of entries that will fail: \code{decimalLatitude=0}, such data check
#' would return \code{FALSE}.
#' @name dc_coordinates_notzero
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'coordinates_notzero')
#' @section samplePassData:
#' The value for decimalLatitude is not equal to 0.
#' @section sampleFailData:
#' The value for decimalLatitude is equal to 0.
#' @section targetDWCField:
#' decimalLatitude, decimalLongitude
#' @section checkCategory:
#'  location
#' @importFrom magrittr %>%
#' @export
#' @keywords space,likelihood,validation
NULL
