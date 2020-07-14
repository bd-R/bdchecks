#' @rdname dc_mindepth_lessthan_maxdepth
#' 
#' @param input a vector of minimumDepthInMeters.
#' @param input2 a vector of maximumDepthInMeters.
#' 
dc_mindepth_lessthan_maxdepth <- function(
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
