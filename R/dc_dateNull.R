#' @rdname dc_dateNull
#' @param TARGET a vector to perform data check
#' 
dc_dateNull <- function(TARGET) {
  !is.na(TARGET)
}
