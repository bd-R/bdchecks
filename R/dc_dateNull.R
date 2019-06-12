#' @rdname dc_dateNULL
dc_dateNULL <- function(TARGETS) {
  lapply(TARGETS, function(i) !is.na(get(i)))
}
