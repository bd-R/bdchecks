#'
#' Data check taxonrank_present Check if taxonRank exists and is not empty.
#' 
#'
#'     This data check answers: "Is taxonRank information present?"
#' question.\cr Data check will pass if \strong{The value for taxonRank is
#' present.} and will fail if \strong{The value for taxonRank is missing.}.\cr
#' Dimension of this data check is \strong{} and it's flagging type is:
#' \strong{FLAG}\cr Example of entries that will pass:
#' \code{taxonRank=genus}, such data check would return \code{TRUE}.\cr
#' @name dc_taxonrank_present
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'taxonrank_present')
#' @section samplePassData:
#' The value for taxonRank is present.
#' @section sampleFailData:
#' The value for taxonRank is missing.
#' @section targetDWCField:
#' taxonRank
#' @section checkCategory:
#'  taxon
#' @importFrom magrittr %>%
#' @export
#' @keywords taxon,validation,completeness,missing,incomplete
NULL
