#'
#' Data check taxonrank_standard Check if taxonRank is standard.
#'
#'     This data check answers: "Is taxonRank information standard?" question.\cr Data check will pass if \strong{The value for taxonRank is standard.} and will fail if \strong{The value for taxonRank is missing or not standard.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{taxonRank=domain}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{taxonRank=realm}, such data check would return \code{FALSE}.
#' @name dc_taxonrank_standard
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'taxonrank_standard')
#' @section samplePassData:
#' The value for taxonRank is standard.
#' @section sampleFailData:
#' The value for taxonRank is missing or not standard.
#' @section targetDWCField:
#' taxonRank
#' @section checkCategory:
#'  taxon
#' @importFrom magrittr %>%
#' @export
#' @keywords taxon,validation,completeness,missing,incomplete
NULL
