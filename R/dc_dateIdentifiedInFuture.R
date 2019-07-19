#' @rdname dc_dateIdentifiedInFuture
#' @param TARGET a vector to perform data check
#' 
dc_dateIdentifiedInFuture <- function(TARGET) {
  as.Date(ifelse(TARGET == "", NA, TARGET), origin = "1970-01-01") <= Sys.Date()
}
