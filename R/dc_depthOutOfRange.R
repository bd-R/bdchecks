#' @rdname dc_depthOutOfRange
dc_depthOutOfRange <- function(TARGETS, minD = 0, maxD = 11e3) {
  depthOutOfRange <- function(TARGET) {
    get(TARGET) >= minD & get(TARGET) <= maxD 
  }
  lapply(TARGETS, depthOutOfRange)
}