#'
#' Data check maxelevation_inrange Check if maximumElevationInMeters is
#' within parameter range.
#'
#'     This data check answers: "Is maximumElevationInMeters within parameter
#' range?" question.\cr Data check will pass if \strong{The value for
#' maximumElevationInMeters within given numbers.} and will fail if \strong{The
#' value for maximumElevationInMeters is not within given numbers.}.\cr
#' Dimension of this data check is \strong{} and it's flagging type is:
#' \strong{FLAG}\cr Example of entries that will pass:
#' \code{maximumElevationInMeters=0}, such data check would return
#' \code{TRUE}.\cr Example of entries that will fail:
#' \code{maximumElevationInMeters=9999}, such data check would return
#' @name dc_maxelevation_inrange
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'maxelevation_inrange')
#' @section samplePassData:
#' The value for maximumElevationInMeters within given numbers.
#' @section sampleFailData:
#' The value for maximumElevationInMeters is not within given numbers.
#' @section targetDWCField:
#' maximumElevationInMeters
#' @section checkCategory:
#'  location
#' @importFrom magrittr %>%
#' @export
#' @keywords space,validation,conformance
NULL
