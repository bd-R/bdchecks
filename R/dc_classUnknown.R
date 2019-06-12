#' @rdname dc_classUnkown
dc_classUnkown <- function(TARGET) {
  VOCABULARY <- c("Mammalia", "Aves", "Reptilia")
  TARGETmod <- gsub("_| ", "", TARGET)
  tolower(TARGETmod) %in% tolower(VOCABULARY)
}
