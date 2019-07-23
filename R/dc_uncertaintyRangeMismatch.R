#' @rdname dc_uncertaintyRangeMismatch
#' 
#' @param TARGET a vector of uncertainty
#' 
dc_uncertaintyRangeMismatch <- function(TARGET) {
  result <- TARGET %>%
    trimws() %>% # Trim extra whitespace
    gsub(" ", "", .) %>% # Remove possible spaces
    as.numeric() # This is main criteria - value must be turned numeric
  # Precesion must be an integer greater than 0
  result <- result %% 1 == 0 & result > 0
  return(perform_dc_missing(result, TARGET))
}