#'
#' Data check occurrenceIdNotGuid 
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{} and will fail if \strong{}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name dc_occurrenceIdNotGuid
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'occurrenceIdNotGuid')
#' @section samplePassData:
#' occurrenceID is a globally uninique identifier (GUID)
#' @section sampleFailData:
#' occurrenceID is an integer, assuring that it is not a globally uninique identifier (GUID)
#' @section targetDWCField:
#' occurrenceID
#' @section checkCategory:
#'  Occurrence
#' @export

NULL
