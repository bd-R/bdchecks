#' @rdname dc_coordinatesZero
dc_coordinatesZero <- function(TARGETS) {
  coordinatesZero <- function(TARGET) {
    get(TARGET) != 0
  }
  lapply(TARGETS, coordinatesZero)
}
