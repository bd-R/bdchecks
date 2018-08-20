#'
#' Data check dayInvalid Check if event day is valid (1 <= integer <= 31)
#'
#'     This data check answers: "Is event day valid??" question.\cr Data check will pass if \strong{The value given for event day is between 1 and 31} and will fail if \strong{The value given for event day is less than 1 or greater than 31}.\cr Dimension of this data check is \strong{Conformance} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{}, such data check would return \code{}.\cr Example of entries that will fail: \code{}, such data check would return \code{}.
#' @name dayInvalid
#' @docType data
#' @format An object of class \code{"dataCheck"}, see \code{\link{dataCheck}} for details.
#' @references LATER
#' @section samplePassData:
#' The value given for event day is between 1 and 31
#' @section sampleFailData:
#' The value given for event day is less than 1 or greater than 31
#' @section targetDWCField:
#' day
#' @section checkCategory:
#'  Event

NULL
