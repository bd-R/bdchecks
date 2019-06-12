#' @rdname dc_coordinatePrecisionMismatch
dc_coordinatePrecisionMismatch <- function(TARGETS) {
  coordinatePrecisionMismatch <- function(TARGET) {
    TARGET <- get(TARGET)
    nTARGET <- nchar(gsub("(.*\\.)|([0]*$)", "", as.character(TARGET)))
    nDEPEND <- nchar(gsub("(.*\\.)|([0]*$)", "", as.character(DEPEND)))
    nTARGET <= nDEPEND
  }
  lapply(TARGETS, coordinatePrecisionMismatch)
}
