#' @rdname dc_monthInvalid
#' @param TARGET a vector to perform data check
#' 
dc_monthInvalid <- function(TARGET) {
  TARGET %% 1 == 0 & TARGET >= 1 & TARGET <= 12
}
