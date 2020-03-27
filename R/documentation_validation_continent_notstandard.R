#'
#' Data check validation_continent_notstandard Check if continent is within a set of available continent names.
#'
#'     This data check answers: "Is continent information valid?" question.\cr Data check will pass if \strong{The value for continent is present and correct.} and will fail if \strong{The value for continent is missing or incorrect.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{continent=Europe}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{continent=North Europe}, such data check would return \code{FALSE}.
#' @name dc_validation_continent_notstandard
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_continent_notstandard')
#' @section samplePassData:
#' The value for continent is present and correct.
#' @section sampleFailData:
#' The value for continent is missing or incorrect.
#' @section targetDWCField:
#' continent
#' @section checkCategory:
#'  location
#' @importFrom magrittr %>%
#' @export
#' @keywords space,validation,vocabulary,parametrized
NULL
