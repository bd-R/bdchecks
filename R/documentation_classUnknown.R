#'
#' Data check classUnknown 
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{} and will fail if \strong{}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name dc_classUnknown
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references None
#' @examples 
#' performDC(DC = dc_classUnknown, DATA = bdchecks::data_bats)
#' @section samplePassData:
#' Taxonomic rank Class was interpreted correctly
#' @section sampleFailData:
#' Taxonomic rank Class value cannot be interpreted
#' @section targetDWCField:
#' class
#' @section checkCategory:
#'  Taxon
#' @export

NULL
