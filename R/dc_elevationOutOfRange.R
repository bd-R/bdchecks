#' @rdname dc_elevationOutOfRange
#' 
#' @param TARGET a vector of numeric values for elevation. To pass must be
#' between min_ele and max_ele.
#' @param min_ele a numeric value specifying minimum elevation.
#' @param max_ele a numeric value specifying maximum elevation.
#' 
dc_elevationOutOfRange <- function(TARGET, min_ele = 0, max_ele = 1e4) {
  result <- TARGET %>%
    gsub(" ", "", .) %>% # Remove possible spaces
    as.numeric() # Value must be turned numeric
  # Main part - check if value is within range
  result <- result >= min_ele & result <= max_ele 
  return(perform_dc_missing(result, TARGET))
}