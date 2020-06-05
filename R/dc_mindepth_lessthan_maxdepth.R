#' @rdname dc_mindepth_lessthan_maxdepth
#' 
#' @param TARGET a vector of minimumDepthInMeters.
#' @param TARGET2 a vector of maximumDepthInMeters.
#' 
dc_mindepth_lessthan_maxdepth <- function(
  TARGET = NULL,
  TARGET2 = NULL
) {
  suppressWarnings(
    result1 <- TARGET %>%
      trimws() %>%
      as.numeric()
  )
  suppressWarnings(
    result2 <- TARGET2 %>%
      trimws() %>%
      as.numeric()
  )
  result <- as.numeric(result1) <= as.numeric(result2)
  foo <- perform_dc_missing(result, TARGET)
  bar <- perform_dc_missing(result, TARGET2)
  return(foo + bar == 2)
}