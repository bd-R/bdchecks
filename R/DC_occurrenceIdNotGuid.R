#'
#' Data check occurrenceIdNotGuid Check if an identifier for the occurrence is a globally uniquely identifier (currently we use regex pattern solution is implemented)
#'
#'     This data check answers: "Is occurence ID and GUID??" question.\cr Data check will pass if \strong{occurrenceID is a globally uninique identifier (GUID)} and will fail if \strong{occurrenceID is an integer, assuring that it is not a globally uninique identifier (GUID)}.\cr Dimension of this data check is \strong{Conformance} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name occurrenceIdNotGuid
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references LATER
#' @section samplePassData:
#' occurrenceID is a globally uninique identifier (GUID)
#' @section sampleFailData:
#' occurrenceID is an integer, assuring that it is not a globally uninique identifier (GUID)
#' @section targetDWCField:
#' occurrenceID
#' @section checkCategory:
#'  Occurrence

NULL
