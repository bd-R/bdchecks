#' @rdname dc_validation_minelevation_greaterthan_maxelevation
#' 
#' @param TARGET a vector of minimumElevationInMeters.
#' @param TARGET2 a vector of maximumElevationInMeters.
#' 
dc_validation_minelevation_greaterthan_maxelevation <- function(
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