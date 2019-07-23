#' @rdname dc_elevationOutOfRange
#' 
#' @param TARGET a vector of numeric values for elevation
#' @param min_ele a numeric value specifying minimum elevation
#' @param max_ele a numeric value specifying maximum elevation
#' 
dc_elevationOutOfRange <- function(TARGET, min_ele = 0, max_ele = 1e4) {
  # Turns values to numeric (incase of 1e3)
  result <- as.numeric(TARGET)
  # Main part - check if value is within range
  result <- result >= min_ele & result <= max_ele 
  return(perform_dc_missing(result, TARGET))
}