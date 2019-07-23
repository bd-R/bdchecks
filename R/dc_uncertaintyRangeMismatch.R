#' @rdname dc_uncertaintyRangeMismatch
#' 
#' @param TARGET a vector of coordinate uncertainty. To pass it must be a
#' positive integer.
#' 
dc_uncertaintyRangeMismatch <- function(TARGET) {
  result <- TARGET %>%
    gsub(" ", "", .) %>% # Remove possible spaces
    as.numeric() # This is main criteria - value must be turned numeric
  # Must be an integer greater than 0
  result <- result %% 1 == 0 & result > 0
  return(perform_dc_missing(result, TARGET))
}