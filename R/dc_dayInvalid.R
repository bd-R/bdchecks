#' @rdname dc_dayInvalid
dc_dayInvalid <- function(TARGET) {
  TARGET %% 1 == 0 & TARGET >= 1 & TARGET <= 31
}
