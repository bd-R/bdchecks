#'
#' Data check modifiedInFuture 
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{} and will fail if \strong{}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name dc_modifiedInFuture
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'modifiedInFuture')
#' @section samplePassData:
#' dcterms:modified date is valid
#' @section sampleFailData:
#' dcterms:modified is in the future
#' @section targetDWCField:
#' modified
#' @section checkCategory:
#'  Record_level Terms
#' @export

NULL
