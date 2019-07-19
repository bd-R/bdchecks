#' @rdname dc_yearMissing
#' @param TARGET a vector to perform data check
#' 
dc_yearMissing <- function(TARGET) {
  !is.na(TARGET)
}
