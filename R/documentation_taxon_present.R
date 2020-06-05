#'
#' Data check taxon_present Check if at least one field needed to determine the taxon of the entity exists and is not empty.
#'
#'     This data check answers: "Is taxon information present?" question.\cr Data check will pass if \strong{The value for at least one term in the Taxon class is present.} and will fail if \strong{The value for all terms organized in the Taxon class are NULL.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{kingdom=animal}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{kingdom=}, such data check would return \code{FALSE}.
#' @name dc_taxon_present
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'taxon_present')
#' @section samplePassData:
#' The value for at least one term in the Taxon class is present.
#' @section sampleFailData:
#' The value for all terms organized in the Taxon class are NULL.
#' @section targetDWCField:
#' taxonID, scientificNameID, acceptedNameUsageID, parentNameUsageID, originalNameUsageID, taxonConceptID, scientificName, higherClassification, kingdom, phylum, class, order, family, genus, subgenus, specificEpithet, infraspecificEpithet, vernacularName
#' @section checkCategory:
#'  taxon
#' @importFrom magrittr %>%
#' @export
#' @keywords taxon,validation,completeness,missing,incomplete
NULL
