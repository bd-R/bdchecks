#'
#' Data check taxo_level Check if taxonRank is lower than inputted resolution.
#'
#'     This data check answers: "Is taxonRank lower than inputted resolution?" question.\cr Data check will pass if \strong{The value for taxonRank is lower than inputted resolution.} and will fail if \strong{The value for taxonRank is higher than inputted resolution.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{taxonRank="species",resolution="family"}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{taxonRank="family",resolution="species"}, such data check would return \code{FALSE}.
#' @name dc_taxo_level
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'taxo_level')
#' @section samplePassData:
#' The value for taxonRank is lower than inputted resolution.
#' @section sampleFailData:
#' The value for taxonRank is higher than inputted resolution.
#' @section targetDWCField:
#' taxonRank
#' @section checkCategory:
#'  taxon
#' @importFrom magrittr %>%
#' @export
#' @keywords taxon,validation,completeness,missing,incomplete
NULL
