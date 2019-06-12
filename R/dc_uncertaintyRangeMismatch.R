#' @rdname dc_uncertaintyRangeMismatch
dc_uncertaintyRangeMismatch <- function(TARGET) {
  TARGET %% 1 == 0 & TARGET > 0
}
