#'
#' Data check identifiedDateImprobable Check if identification date is between Linnaeus and current date
#'
#'     This data check answers: "Is identification date possible (between Linnaeus and current date)?" question.\cr Data check will pass if \strong{The date of identification (dwc:dateIdentified) is post Linnaeus (1753) to the current date} and will fail if \strong{The date of identification (dwc:dateIdentified) falls prior to Linnaeus (1753) or after the current date.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{dateidentified=2000-01-01}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{dateidentified=1573-02-14,dateidentified=1000-01-01,dateidentified=3000-01-01}, such data check would return \code{Failed}.
#' @name dc_identifiedDateImprobable
#' @format An object of class function to perform a specific data check.
#' @references None
#' @examples 
#' perform_dc(data_bats, 'identifiedDateImprobable')
#' @section samplePassData:
#' The date of identification (dwc:dateIdentified) is post Linnaeus (1753) to the current date
#' @section sampleFailData:
#' The date of identification (dwc:dateIdentified) falls prior to Linnaeus (1753) or after the current date.
#' @section targetDWCField:
#' dateIdentified
#' @section checkCategory:
#'  Identification
#' @importFrom magrittr %>%
#' @export

NULL
