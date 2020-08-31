#'
#' Data check location_present Check if at least one field needed to
#' determine location of the entity exists and is not empty.
#'
#'     This data check answers: "Is location information present?"
#' question.\cr Data check will pass if \strong{The value for at least one
#' term for location is present.} and will fail if \strong{The value for all
#' terms organized for location are NULL.}.\cr Dimension of this data check is
#' \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries
#' that will pass: \code{countryCode=AU}, such data check would return
#' \code{TRUE}.\cr Example of entries that will fail: \code{countryCode=},
#' such data check would return \code{FALSE}.
#' @name dc_location_present
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'location_present')
#' @section samplePassData:
#' The value for at least one term for location is present.
#' @section sampleFailData:
#' The value for all terms organized for location are NULL.
#' @section targetDWCField:
#' country, countryCode, county, decimalLatitude, decimalLongitude,
#' footprintWKT, higherGeography, higherGeographyID, island, islandGroup,
#' locality, locationID, municipality, stateProvince, verbatimCoordinates,
#' verbatimLatitude, verbatimLocality, verbatimLongitude, waterBody
#' @section checkCategory:
#'  location
#' @importFrom magrittr %>%
#' @export
#' @keywords location,validation,completeness,missing,incomplete
NULL
