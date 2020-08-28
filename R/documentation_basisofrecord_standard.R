#'
#' Data check basisofrecord_standard Check if basisOfRecord is specified
#' source authority service.
#'
#'     This data check answers: "Is basisOfRecord within given source
#' authority list?" question.\cr Data check will pass if \strong{The value for
#' basisOfRecord is present and correct.} and will fail if \strong{The value
#' for basisOfRecord is missing or incorrect.}.\cr Dimension of this data check
#' is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of
#' entries that will pass: \code{basisOfRecord=human_observation}, such data
#' check would return \code{TRUE}.\cr Example of entries that will fail:
#' \code{basisOfRecord=photos}, such data check would return \code{FALSE}.
#' @name dc_basisofrecord_standard
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'basisofrecord_standard')
#' @section samplePassData:
#' The value for basisOfRecord is present and correct.
#' @section sampleFailData:
#' The value for basisOfRecord is missing or incorrect.
#' @section targetDWCField:
#' basisOfRecord
#' @section checkCategory:
#'  record-level terms
#' @importFrom magrittr %>%
#' @export
#' @keywords vocabulary,validation
NULL
