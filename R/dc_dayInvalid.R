#' @rdname dc_dayInvalid
#' @param TARGET a vector to perform data check
#' 
dc_dayInvalid <- function(TARGET) {
  TARGET %% 1 == 0 & TARGET >= 1 & TARGET <= 31
}
