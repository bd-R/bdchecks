#'
#' Data check dataGeneralised Chech if dataGeneralizations is a NULL column (ie, latitude and longitude were not generalized)
#'
#'     This data check answers: "Is dataGeneralizations NULL??" question.\cr Data check will pass if \strong{Latitude and longitude values have not been generalized as indicated by dwc:dataGeneralizations is NULL} and will fail if \strong{Latitude and longitude values may have been generalized as indicated by dwc:dataGeneralizations is not NULL}.\cr Dimension of this data check is \strong{Resolution} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{dataGeneralizations=}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{dataGeneralizations=record placed on 0.1 degree grid}, such data check would return \code{Failed}.
#' @name DC_dataGeneralised
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references None
#' @examples 
#' performDC(DC = DC_dataGeneralised, DATA = bdchecks::dataBats)
#' @section samplePassData:
#' Latitude and longitude values have not been generalized as indicated by dwc:dataGeneralizations is NULL
#' @section sampleFailData:
#' Latitude and longitude values may have been generalized as indicated by dwc:dataGeneralizations is not NULL
#' @section targetDWCField:
#' dataGeneralizations
#' @section checkCategory:
#'  Record_level Terms

NULL
