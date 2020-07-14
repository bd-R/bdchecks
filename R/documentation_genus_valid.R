#'
#' Data check genus_valid Check if genus was found as a value at the rank of genus by the specified source authority service.
#'
#'     This data check answers: "Is genus information valid?" question.\cr Data check will pass if \strong{The value for genus is present and correct.} and will fail if \strong{The value for genus is missing or incorrect.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{genus=Canis}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{genus=}, such data check would return \code{FALSE}.
#' @name dc_genus_valid
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'genus_valid')
#' @section samplePassData:
#' The value for genus is present and correct.
#' @section sampleFailData:
#' The value for genus is missing or incorrect.
#' @section targetDWCField:
#' genus
#' @section checkCategory:
#'  taxon
#' @importFrom magrittr %>%
#' @export
#' @keywords taxon,validation
NULL
