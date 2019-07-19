#' @rdname dc_namePublishedYearInFuture
#' @param TARGET a vector to perform data check
#' 
dc_namePublishedYearInFuture <- function(TARGET) {
  format(as.Date(ifelse(TARGET == "", NA, TARGET), origin = "1970-01-01"), "%Y") <= format(Sys.Date(), "%Y")
}
