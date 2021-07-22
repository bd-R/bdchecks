#'
#' Data check earliest_date Check if eventDate is greater than inputted
#' resolution.
#'
#'     This data check answers: "Is eventDate greater than inputted
#' resolution?" question.\cr Data check will pass if \strong{The value for
#' eventDate is greater than provided resolution.} and will fail if \strong{The
#' value for eventDate is not greater than provided resolution.}.\cr Dimension
#' of this data check is \strong{} and it's flagging type is:
#' \strong{FLAG}\cr Example of entries that will pass:
#' \code{eventDate="2002-02-02",provided_input="1996-07-06"}, such data check
#' would return \code{TRUE}.\cr Example of entries that will fail:
#' \code{eventDate="2002-02-02",provided_input="2020-06-01"}, such data check
#' @name dc_earliest_date
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(
#'   data_bats, 'earliest_date', flags = FALSE, c("2018-02-02")
#' )
#' @section samplePassData:
#' The value for eventDate is greater than provided resolution.
#' @section sampleFailData:
#' The value for eventDate is not greater than provided resolution.
#' @section targetDWCField:
#' eventDate
#' @section checkCategory:
#'  event
#' @importFrom magrittr %>%
#' @export
#' @keywords time,validation,conformance
NULL
