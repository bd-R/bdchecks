#' @rdname dc_precisionRangeMismatch
#' 
#' @param TARGET a vector of precision range
#' 
dc_precisionRangeMismatch <- function(TARGET) {
  result <- TARGET %>%
    trimws() %>% # Trim extra whitespace
    as.numeric() # This is main criteria - value must be turned numeric
  # Precesion must be between 0 & 1
  result <- result >= 0 & result <= 1
  return(perform_dc_missing(result, TARGET))
}