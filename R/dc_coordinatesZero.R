#' @rdname dc_coordinatesZero
#' 
#' @param TARGET a vector of coordinate information
#' 
dc_coordinatesZero <- function(TARGET) {
  result <- TARGET %>%
    trimws() %>% # Trim extra whitespace
    as.numeric() # Value must be turned numeric
  # Main part - check if value is equal to one
  result <- result == 1
  return(perform_dc_missing(result, TARGET))
}