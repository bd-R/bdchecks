#'
#' Data check basisOfRecordBadlyFormed Check if the specific nature of the data record is within controlled vocabulary
#'
#'     This data check answers: "Is basis of record within controlled vocabulary?" question.\cr Data check will pass if \strong{dwc:basisOfRecord was matched to vocabulary} and will fail if \strong{dwc:basisOfRecord could not be unambiguously matched to vocabulary}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{basisOfRecord=HumanObservation,basisOfRecord=LIVING_SPECIMEN}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{basisOfRecord=Human specimen}, such data check would return \code{Failed}.
#' @name dc_basisOfRecordBadlyFormed
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'basisOfRecordBadlyFormed')
#' @section samplePassData:
#' dwc:basisOfRecord was matched to vocabulary
#' @section sampleFailData:
#' dwc:basisOfRecord could not be unambiguously matched to vocabulary
#' @section targetDWCField:
#' basisOfRecord
#' @section checkCategory:
#'  Record_level Terms
#' @importFrom magrittr %>%
#' @export

NULL
