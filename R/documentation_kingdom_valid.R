#'
#' Data check kingdom_valid Check if kingdom was found as a value at the rank
#' of kingdom by the specified source authority service.
#'
#'     This data check answers: "Is kingdom information valid?" question.\cr
#' Data check will pass if \strong{The value for kingdom is present and valid.}
#' and will fail if \strong{The value for kingdom is missing or invalid.}.\cr
#' Dimension of this data check is \strong{} and it's flagging type is:
#' \strong{FLAG}\cr Example of entries that will pass:
#' \code{kingdom=Animalia}, such data check would return \code{TRUE}.\cr
#' Example of entries that will fail: \code{kingdom=birds}, such data check
#' @name dc_kingdom_valid
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'kingdom_valid')
#' @section samplePassData:
#' The value for kingdom is present and valid.
#' @section sampleFailData:
#' The value for kingdom is missing or invalid.
#' @section targetDWCField:
#' kingdom
#' @section checkCategory:
#'  taxon
#' @importFrom magrittr %>%
#' @export
#' @keywords taxon,validation
NULL
