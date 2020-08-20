#'
#' Data check phylum_valid Check if phylum was found as a value at the rank
#' of phylum by the specified source authority service.
#'
#'     This data check answers: "Is phylum information valid?" question.\cr
#' Data check will pass if \strong{The value for phylum is present and
#' correct.} and will fail if \strong{The value for phylum is missing or
#' incorrect.}.\cr Dimension of this data check is \strong{} and it's flagging
#' type is: \strong{FLAG}\cr Example of entries that will pass:
#' \code{phylum=Chordate}, such data check would return \code{TRUE}.\cr
#' Example of entries that will fail: \code{phylum=birds}, such data check
#' @name dc_phylum_valid
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'phylum_valid')
#' @section samplePassData:
#' The value for phylum is present and correct.
#' @section sampleFailData:
#' The value for phylum is missing or incorrect.
#' @section targetDWCField:
#' phylum
#' @section checkCategory:
#'  taxon
#' @importFrom magrittr %>%
#' @export
#' @keywords taxon,validation
NULL
