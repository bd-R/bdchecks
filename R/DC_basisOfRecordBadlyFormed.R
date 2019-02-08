#'
#' Data check basisOfRecordBadlyFormed Check if the specific nature of the data record is within controlled vocabulary
#'
#'     This data check answers: "Is basis of record within controlled vocabulary??" question.\cr Data check will pass if \strong{dwc:basisOfRecord was matched to vocabulary} and will fail if \strong{dwc:basisOfRecord could not be unambiguously matched to vocabulary}.\cr Dimension of this data check is \strong{Conformance} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{basisOfRecord=HumanObservation,basisOfRecord=LIVING_SPECIMEN}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{basisOfRecord=Human specimen}, such data check would return \code{Failed}.
#' @name DC_basisOfRecordBadlyFormed
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references None
#' @examples 
#' performDC(DC = DC_basisOfRecordBadlyFormed, DATA = bdchecks::dataBats)
#' @section samplePassData:
#' dwc:basisOfRecord was matched to vocabulary
#' @section sampleFailData:
#' dwc:basisOfRecord could not be unambiguously matched to vocabulary
#' @section targetDWCField:
#' basisOfRecord
#' @section checkCategory:
#'  Record_level Terms

NULL
