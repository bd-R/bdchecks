#' @rdname dc_classUnknown
#' @param TARGET a vector to perform data check
#' 
dc_classUnknown <- function(TARGET) {
  VOCABULARY <- c("Mammalia", "Aves", "Reptilia")
  TARGETmod <- gsub("_| ", "", TARGET)
  tolower(TARGETmod) %in% tolower(VOCABULARY)
}
