#' @rdname dc_elevationOutOfRange
dc_elevationOutOfRange <- function(TARGETS, minE = 0, maxE = 1e4) {
  elevationOutOfRange <- function(TARGET) {
    get(TARGET) >= minE & get(TARGET) <= maxE 
  }
  lapply(TARGETS, elevationOutOfRange)
}
