#' @rdname dc_coordinatesZero
#' 
#' @param TARGET a vector of coordinate information. To pass must be equal to 1.
#' 
dc_coordinatesZero <- function(TARGET) {
   result <- TARGET %>%
    gsub(" ", "", .) %>% # Remove possible spaces
    as.numeric() # Value must be turned numeric
  # Main part - check if value is equal to one
  result <- result == 1
  return(perform_dc_missing(result, TARGET))
}