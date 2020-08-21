#'
#' Data check temporal_resolution Check if eventDate is within given range
#' and resolution.
#'
#'     This data check answers: "Is eventDate within given range and
#' resolution?" question.\cr Data check will pass if \strong{The value for
#' eventDate is within given range and resolution.} and will fail if
#' \strong{The value for eventDate is not within given range and
#' resolution.}.\cr Dimension of this data check is \strong{} and it's
#' flagging type is: \strong{FLAG}\cr Example of entries that will pass:
#' 
#' 
#' 
#' @name dc_temporal_resolution
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'temporal_resolution', c("2016-01-02", "2018-02-08", "month"))
#' @section samplePassData:
#' The value for eventDate is within given range and resolution.
#' @section sampleFailData:
#' The value for eventDate is not within given range and resolution.
#' @section targetDWCField:
#' eventDate
#' @section checkCategory:
#'  event
#' @importFrom magrittr %>%
#' @export
#' @keywords time,validation,conformance
NULL
