#' @rdname dc_coordinatePrecisionMismatch
#' @param TARGET a vector to perform data check
#' @param DEPEND a vector of coordinate precision value
#' 
dc_coordinatePrecisionMismatch <- function(TARGET, DEPEND) {
  nTARGET <- nchar(gsub("(.*\\.)|([0]*$)", "", as.character(TARGET)))
  nDEPEND <- nchar(gsub("(.*\\.)|([0]*$)", "", as.character(DEPEND)))
  nTARGET <= nDEPEND
}