#'
#' Data check dateNull Checks if date feeld is not empty
#'
#'     This data check answers: "Is date feeld not empty?" question.\cr Data check will pass if strong{Date information is present}and fail if strong{No date information}.\cr Dimension of this data check is strong{Completness}and it's flagging type is: strong{FLAG}\cr Example of entries that will pass:year=2010 + eventDate=2010.01.01 + verbatimEventDate=2010.01.01\cr Passed data check will generate:TRUEoutput.\cr Example of entries that will fail:year=NULL + eventDate=NULL + verbatimEventDate=NULL, year=2010 + eventDate=NULL + verbatimEventDate=NULL\cr Failed data check will generate:FALSEoutput.
#' @name dateNull
#' @docType data
#' @format An object of class \code{"dataCheck"}, see\code{\link{dataCheck}} for details.
#' @references LATER
#' @keywords date
NULL
