#'
#' Data check eventdate_standard Check if eventDate is a valid ISO
#' 8601-1:2019 date.
#'
#'     This data check answers: "Is eventDate a valid ISO 8601-1:2019 date?"
#' question.\cr Data check will pass if \strong{Given eventDate is a valid ISO
#' 8601-1:2019 date.} and will fail if \strong{Given eventDate is not a valid
#' ISO 8601-1:2019 date.}.\cr Dimension of this data check is \strong{} and
#' it's flagging type is: \strong{FLAG}\cr Example of entries that will pass:
#' \code{eventDate="02021981"}, such data check would return \code{TRUE}.\cr
#' Example of entries that will fail: \code{eventDate="2018-02-02"}, such data
#' check would return \code{FALSE}.
#' @name dc_eventdate_standard
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'eventdate_standard')
#' @section samplePassData:
#' Given eventDate is a valid ISO 8601-1:2019 date.
#' @section sampleFailData:
#' Given eventDate is not a valid ISO 8601-1:2019 date.
#' @section targetDWCField:
#' eventDate
#' @section checkCategory:
#'  event
#' @importFrom magrittr %>%
#' @export
#' @keywords time,validation,conformance
NULL
