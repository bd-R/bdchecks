#' @rdname dc_individualcountInvalid
dc_individualcountInvalid <- function(TARGET) {
  TARGET %% 1 == 0 & TARGET >= 0
}