#'
#' Data check dataGeneralised 
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{} and will fail if \strong{}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name dc_dataGeneralised
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'dataGeneralised')
#' @section samplePassData:
#' Latitude and longitude values have not been generalized as indicated by dwc:dataGeneralizations is NULL
#' @section sampleFailData:
#' Latitude and longitude values may have been generalized as indicated by dwc:dataGeneralizations is not NULL
#' @section targetDWCField:
#' dataGeneralizations
#' @section checkCategory:
#'  Record_level Terms
#' @importFrom magrittr %>%
#' @export

NULL
