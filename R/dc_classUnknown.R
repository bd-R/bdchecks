#' @rdname dc_classUnknown
dc_classUnknown <- function(TARGET) {
  VOCABULARY <- c("Mammalia", "Aves", "Reptilia")
  TARGETmod <- gsub("_| ", "", TARGET)
  tolower(TARGETmod) %in% tolower(VOCABULARY)
}
