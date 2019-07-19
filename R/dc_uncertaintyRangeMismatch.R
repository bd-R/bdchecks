#' @rdname dc_uncertaintyRangeMismatch
#' @param TARGET a vector to perform data check
#' 
dc_uncertaintyRangeMismatch <- function(TARGET) {
  TARGET %% 1 == 0 & TARGET > 0
}
