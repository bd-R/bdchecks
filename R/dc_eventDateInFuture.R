#' @rdname dc_eventDateInFuture
dc_eventDateInFuture <- function(TARGET) {
  as.Date(ifelse(TARGET == "", NA, TARGET), origin = "1970-01-01") <= Sys.Date()
}
