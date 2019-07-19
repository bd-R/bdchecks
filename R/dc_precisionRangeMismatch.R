#' @rdname dc_precisionRangeMismatch
#' @param TARGET a vector to perform data check
#' 
dc_precisionRangeMismatch <- function(TARGET) {
  TARGET >= 0 & TARGET <= 1
}
