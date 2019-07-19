#' @rdname dc_countryNameUnknown
#' @param TARGET a vector to perform data check
#' @param DEPEND a vector of country names
#' 
dc_countryNameUnknown <- function(TARGET, DEPEND) {
  TARGET %in% DEPEND
}
