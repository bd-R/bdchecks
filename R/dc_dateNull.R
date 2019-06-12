#' @rdname dc_dateNull
dc_dateNull <- function(TARGETS) {
  lapply(TARGETS, function(i) !is.na(get(i)))
}
