#' @rdname dc_precisionRangeMismatch
#' 
#' @param TARGET a vector of precision range
#' 
#' @importFrom magrittr "%>%"
#' 
dc_precisionRangeMismatch <- function(TARGET) {
  result <- TARGET %>%
    trimws() %>% # Trim extra whitespace
    as.numeric() # This is main criteria - value must be turned numeric
  # Precesion must be between 0 & 1
  result <- result >= 0 & result <= 1

  # Turn failed values to FALSE
  result[is.na(result)] <- FALSE
  # Get original missing values
  result[is.na(TARGET) | TARGET == ""] <- NA
  return(result)
}