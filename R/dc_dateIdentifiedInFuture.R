#' @rdname dc_dateIdentifiedInFuture
dc_dateIdentifiedInFuture <- function(TARGET) {
  as.Date(ifelse(TARGET == "", NA, TARGET), origin = "1970-01-01") <= Sys.Date()
}
