#'
#' Data check identifiedDateImprobable Check if identification date is between Linnaeus and current date
#'
#'     This data check answers: "Is identification date possible (between Linnaeus and current date)??" question.\cr Data check will pass if \strong{The date of identification (dwc:dateIdentified) is post Linnaeus (1753) to the current date} and will fail if \strong{The date of identification (dwc:dateIdentified) falls prior to Linnaeus (1753) or after the current date.}.\cr Dimension of this data check is \strong{Conformance} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name identifiedDateImprobable
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references LATER

NULL
