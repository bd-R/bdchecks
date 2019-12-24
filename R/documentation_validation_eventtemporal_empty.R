#'
#' Data check validation_eventtemporal_empty Check if at least one field needed to determine event temporal of the entity exists and is not empty.
#'
#'     This data check answers: "Is event temporal information present?" question.\cr Data check will pass if \strong{The value for at least one term for event temporal is present.} and will fail if \strong{The value for all terms organized for event temporal are NULL.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{year=2000}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{year=}, such data check would return \code{FALSE}.
#' @name dc_validation_eventtemporal_empty
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_eventtemporal_empty')
#' @section samplePassData:
#' The value for at least one term for event temporal is present.
#' @section sampleFailData:
#' The value for all terms organized for event temporal are NULL.
#' @section targetDWCField:
#' day, endDayOfYear, eventDate, month, startDayOfYear, verbatimEventDate, year
#' @section checkCategory:
#'  location
#' @importFrom magrittr %>%
#' @export
#' @keywords location,validation,completeness,missing,incomplete
NULL
