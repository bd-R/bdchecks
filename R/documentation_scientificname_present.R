#'
#' Data check scientificname_present Check if scientificName exists and is
#' not empty.
#'
#'     This data check answers: "Is scientificName information present?"
#' question.\cr Data check will pass if \strong{The value for scientificName
#' is present.} and will fail if \strong{The value for scientificName is
#' missing.}.\cr Dimension of this data check is \strong{} and it's flagging
#' type is: \strong{FLAG}\cr Example of entries that will pass:
#' \code{scientificName=banana}, such data check would return \code{TRUE}.\cr
#' Example of entries that will fail: \code{scientificName=}, such data check
#' would return \code{FALSE}.
#' @name dc_scientificname_present
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'scientificname_present')
#' @section samplePassData:
#' The value for scientificName is present.
#' @section sampleFailData:
#' The value for scientificName is missing.
#' @section targetDWCField:
#' scientificName
#' @section checkCategory:
#'  taxon
#' @importFrom magrittr %>%
#' @export
#' @keywords taxon,validation,completeness,missing,incomplete
NULL
