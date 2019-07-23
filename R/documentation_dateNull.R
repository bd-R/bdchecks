#'
#' Data check dateNull Check if eventDate, year, verbatimEventDate are not NULL
#'
#'     This data check answers: "Is eventDate, year or verbatimEventDate not NULL?" question.\cr Data check will pass if \strong{Date information is present} and will fail if \strong{No date information}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{year=2000 + eventDate=2000.01.01 + verbatimEventDate=2000.01.01}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{year=NULL + eventDate=NULL + verbatimEventDate=NULL}, such data check would return \code{Failed}.
#' @name dc_dateNull
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'dateNull')
#' @section samplePassData:
#' Date information is present
#' @section sampleFailData:
#' No date information
#' @section targetDWCField:
#' eventDate,year,verbatimEventDate
#' @section checkCategory:
#'  Event
#' @importFrom magrittr %>%
#' @export

NULL
