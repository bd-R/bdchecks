#' @rdname dc_depthOutOfRange
#' @param TARGETS a list of vectors to perform data check
#' @param minD a numeric value specifying minimum depth
#' @param maxD a numeric value specifying maximum depth

dc_depthOutOfRange <- function(TARGETS, minD = 0, maxD = 11e3) {
  depthOutOfRange <- function(TARGET) {
    get(TARGET) >= minD & get(TARGET) <= maxD 
  }
  lapply(TARGETS, depthOutOfRange)
}