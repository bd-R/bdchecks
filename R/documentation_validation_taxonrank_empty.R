#'
#' Data check validation_taxonrank_empty Check if taxonRank exists and is not empty.
#'
#'     This data check answers: "Is taxonRank information present?" question.\cr Data check will pass if \strong{The value for taxonRank is present.} and will fail if \strong{The value for taxonRank is missing.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{taxonRank=genus}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{taxonRank=}, such data check would return \code{FALSE}.
#' @name dc_validation_taxonrank_empty
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_taxonrank_empty')
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
#' @keywords taxon,validation,completness,missing,incomplete
NULL
