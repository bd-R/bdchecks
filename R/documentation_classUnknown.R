#'
#' Data check classUnknown The full scientific name of the class in which the taxon is classified is within given vocabulary
#'
#'     This data check answers: "Is scientific name of the class known?" question.\cr Data check will pass if \strong{Taxonomic rank Class was interpreted correctly} and will fail if \strong{Taxonomic rank Class value cannot be interpreted}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{class=Unicorns}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{class=Birds}, such data check would return \code{Failed}.
#' @name dc_classUnknown
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'classUnknown')
#' @section samplePassData:
#' Taxonomic rank Class was interpreted correctly
#' @section sampleFailData:
#' Taxonomic rank Class value cannot be interpreted
#' @section targetDWCField:
#' class
#' @section checkCategory:
#'  Taxon
#' @importFrom magrittr %>%
#' @export

NULL
