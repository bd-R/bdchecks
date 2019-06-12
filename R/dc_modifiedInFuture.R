#' @rdname dc_modifiedInFuture
dc_modifiedInFuture <- function(TARGET) {
  as.Date(ifelse(TARGET == "", NA, TARGET), origin = "1970-01-01") <= Sys.Date()
}
