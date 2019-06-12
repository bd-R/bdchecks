#' @rdname dc_namePublishedYearInFuture
dc_namePublishedYearInFuture <- function(TARGET) {
  format(as.Date(ifelse(TARGET == "", NA, TARGET), origin = "1970-01-01"), "%Y") <= format(Sys.Date(), "%Y")
}
