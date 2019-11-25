#'
#' Data check validation_kingdom_notfound Check if kingdom was found as a value at the rank of kingdom by the specified source authority service.
#'
#'     This data check answers: "Is kingdom information present?" question.\cr Data check will pass if \strong{The value for kingdom is present and correct.} and will fail if \strong{The value for kingdom is missing or incorrect.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{kingdom=Animalia}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{kingdom=birds}, such data check would return \code{FALSE}.
#' @name dc_validation_kingdom_notfound
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_kingdom_notfound')
#' @section samplePassData:
#' The value for kingdom is present and correct.
#' @section sampleFailData:
#' The value for kingdom is missing or incorrect.
#' @section targetDWCField:
#' kingdom
#' @section checkCategory:
#'  taxon
#' @importFrom magrittr %>%
#' @export
#' @keywords taxon,validation
NULL
