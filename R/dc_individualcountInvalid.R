#' @rdname dc_individualcountInvalid
#' @param TARGET a vector to perform data check
#' 
dc_individualcountInvalid <- function(TARGET) {
  TARGET %% 1 == 0 & TARGET >= 0
}