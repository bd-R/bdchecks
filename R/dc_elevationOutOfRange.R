#' @rdname dc_elevationOutOfRange
#' @param TARGETS a list of vectors to perform data check
#' @param minE a numeric values specifying minimum elevation
#' @param maxE a numeric values specifying maximum elevation
#'
dc_elevationOutOfRange <- function(TARGETS, minE = 0, maxE = 1e4) {
  elevationOutOfRange <- function(TARGET) {
    get(TARGET) >= minE & get(TARGET) <= maxE 
  }
  lapply(TARGETS, elevationOutOfRange)
}