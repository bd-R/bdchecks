#'
#' Data check namePublishedYearInFuture Check if year in which scientific name was published is not in the future
#'
#'     This data check answers: "Is publication year not in the future?" question.\cr Data check will pass if \strong{dwc:namePublishedInYear is valid} and will fail if \strong{dwc:namePublishedInYear is in the future}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{namePublishedInYear=2000}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{namePublishedInYear=2230}, such data check would return \code{Failed}.
#' @name dc_namePublishedYearInFuture
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'namePublishedYearInFuture')
#' @section samplePassData:
#' dwc:namePublishedInYear is valid
#' @section sampleFailData:
#' dwc:namePublishedInYear is in the future
#' @section targetDWCField:
#' namePublishedInYear
#' @section checkCategory:
#'  Taxon
#' @importFrom magrittr %>%
#' @export

NULL
