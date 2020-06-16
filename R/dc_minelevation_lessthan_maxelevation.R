#' @rdname dc_minelevation_lessthan_maxelevation
#' 
#' @param input a vector of minimumElevationInMeters.
#' @param input2 a vector of maximumElevationInMeters.
#' 
dc_minelevation_lessthan_maxelevation <- function(
  input = NULL,
  input2 = NULL
) {
  suppressWarnings(
    clean_input1 <- input %>%
      trimws() %>%
      as.numeric()
  )
  suppressWarnings(
    clean_input2 <- input2 %>%
      trimws() %>%
      as.numeric()
  )
  result <- as.numeric(clean_input1) <= as.numeric(clean_input2)
  foo <- perform_dc_missing(result, input)
  bar <- perform_dc_missing(result, input2)
  return(foo + bar == 2)
}
