#' @rdname dc_depthOutOfRange
#' 
#' @param TARGET a vector of numeric values for depth
#' @param min_dep a numeric value specifying minimum depth
#' @param max_dep a numeric value specifying maximum depth
#' 
dc_depthOutOfRange <- function(TARGET, min_dep = 0, max_dep = 11e3) {
  # Turns values to numeric (incase of 1e3)
  result <- as.numeric(TARGET)
  # Main part - check if value is within range
  result <- result >= min_dep & result <= max_dep 

  # Turn failed values to FALSE
  result[is.na(result)] <- FALSE
  # Get original missing values
  result[is.na(TARGET) | TARGET == ""] <- NA
  return(result)
}