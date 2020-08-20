#'
#' Data check spatial_resolution Check if coordinateUncertaintyInMeters is
#' not greater than inputted resolution.
#'
#'     This data check answers: "Is coordinateUncertaintyInMeters not greater
#' than inputted resolution?" question.\cr Data check will pass if \strong{The
#' value for coordinateUncertaintyInMeters is not greater than provided
#' resolution.} and will fail if \strong{The value for
#' coordinateUncertaintyInMeters is greater than provided resolution.}.\cr
#' Dimension of this data check is \strong{} and it's flagging type is:
#' \strong{FLAG}\cr Example of entries that will pass:
#' \code{coordinateUncertaintyInMeters="1",provided_input="1000"}, such data
#' check would return \code{TRUE}.\cr Example of entries that will fail:
#' @name dc_spatial_resolution
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'spatial_resolution')
#' @section samplePassData:
#' The value for coordinateUncertaintyInMeters is not greater than provided resolution.
#' @section sampleFailData:
#' The value for coordinateUncertaintyInMeters is greater than provided resolution.
#' @section targetDWCField:
#' coordinateUncertaintyInMeters
#' @section checkCategory:
#'  location
#' @importFrom magrittr %>%
#' @export
#' @keywords space,conformance,validation
NULL
