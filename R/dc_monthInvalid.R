#' @rdname dc_monthInvalid
dc_monthInvalid <- function(TARGET) {
  TARGET %% 1 == 0 & TARGET >= 1 & TARGET <= 12
}
