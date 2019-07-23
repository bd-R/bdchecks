#' @rdname dc_individualCountInvalid
#' 
#' @param TARGET a vector of number of individuals. To pass must be a positive
#' interger.
#' 
dc_individualCountInvalid <- function(TARGET) {
  result <- TARGET %>%
    gsub(" ", "", .) %>% # Remove possible spaces
    as.numeric() # Value must be turned numeric
  # Number of individuals must be an integer greater than 0
  result <- result %% 1 == 0 & result > 0
  return(perform_dc_missing(result, TARGET))
}