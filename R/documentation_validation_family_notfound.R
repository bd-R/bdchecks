#'
#' Data check validation_family_notfound Check if family was found as a value at the rank of family by the specified source authority service.
#'
#'     This data check answers: "Is family information present?" question.\cr Data check will pass if \strong{The value for family is present and correct.} and will fail if \strong{The value for family is missing or incorrect.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{family=Felidae}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{family=}, such data check would return \code{FALSE}.
#' @name dc_validation_family_notfound
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_family_notfound')
#' @section samplePassData:
#' The value for family is present and correct.
#' @section sampleFailData:
#' The value for family is missing or incorrect.
#' @section targetDWCField:
#' family
#' @section checkCategory:
#'  taxon
#' @importFrom magrittr %>%
#' @export
#' @keywords taxon,validation
NULL
