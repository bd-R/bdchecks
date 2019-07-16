#' @rdname dc_coordinatePrecisionMismatch
dc_coordinatePrecisionMismatch <- function(TARGET, DEPEND) {
  nTARGET <- nchar(gsub("(.*\\.)|([0]*$)", "", as.character(TARGET)))
  nDEPEND <- nchar(gsub("(.*\\.)|([0]*$)", "", as.character(DEPEND)))
  nTARGET <= nDEPEND
}
