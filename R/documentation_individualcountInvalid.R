#'
#' Data check individualCountInvalid Check if the number of individuals represented present at the time of the occurrence is and intiger
#'
#'     This data check answers: "Is number of individuals a positive integer?" question.\cr Data check will pass if \strong{The count of individuals is a valid integer} and will fail if \strong{The count of individuals is not an integer and therefore invalid}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{individualCount=1}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{individualCount=0.3,individualCount=-1,individualCount=0}, such data check would return \code{Failed}.
#' @name dc_individualCountInvalid
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'individualCountInvalid')
#' @section samplePassData:
#' The count of individuals is a valid integer
#' @section sampleFailData:
#' The count of individuals is not an integer and therefore invalid
#' @section targetDWCField:
#' individualCount
#' @section checkCategory:
#'  Occurrence
#' @importFrom magrittr %>%
#' @export

NULL
