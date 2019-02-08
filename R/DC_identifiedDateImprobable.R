#'
#' Data check identifiedDateImprobable Check if identification date is between Linnaeus and current date
#'
#'     This data check answers: "?" question.\cr Data check will pass if \strong{The date of identification (dwc:dateIdentified) is post Linnaeus (1753) to the current date} and will fail if \strong{The date of identification (dwc:dateIdentified) falls prior to Linnaeus (1753) or after the current date.}.\cr Dimension of this data check is \strong{Conformance} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{dateidentified=2000-01-01}, such data check would return \code{Passed}.\cr Example of entries that will fail: \code{dateidentified=1573-02-14,dateidentified=1000-01-01,dateidentified=3000-01-01}, such data check would return \code{Failed}.
#' @name DC_identifiedDateImprobable
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references None
#' @examples 
#' performDC(DC = DC_identifiedDateImprobable, DATA = bdchecks::dataBats)
#' @section samplePassData:
#' The date of identification (dwc:dateIdentified) is post Linnaeus (1753) to the current date
#' @section sampleFailData:
#' The date of identification (dwc:dateIdentified) falls prior to Linnaeus (1753) or after the current date.
#' @section targetDWCField:
#' dateIdentified
#' @section checkCategory:
#'  Identification

NULL
