#'
#' Data check validation_taxonid_empty Check if taxonID exists and is not empty.
#'
#'     This data check answers: "Is taxonID information present?" question.\cr Data check will pass if \strong{The value for taxonID is present.} and will fail if \strong{The value for taxonID is missing.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{taxonID=101010}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{taxonID=}, such data check would return \code{FALSE}.
#' @name dc_validation_taxonid_empty
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'validation_taxonid_empty')
#' @section samplePassData:
#' The value for taxonID is present.
#' @section sampleFailData:
#' The value for taxonID is missing.
#' @section targetDWCField:
#' taxonID
#' @section checkCategory:
#'  taxon
#' @importFrom magrittr %>%
#' @export
#' @keywords taxon,validation,completeness,missing,incomplete
NULL
