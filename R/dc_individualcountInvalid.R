#' @rdname dc_individualcountInvalid
#' 
#' @param TARGET a vector of number of individuals
#' 
#' @importFrom magrittr "%>%"
#' 
dc_individualCountInvalid <- function(TARGET) {
  result <- TARGET %>%
    trimws() %>% # Trim extra whitespace
    gsub(" ", "", .) %>% # Remove possible spaces
    as.numeric() # This is main criteria - value must be turned numeric
  # Number of individuals must be an integer greater than 0
  result <- result %% 1 == 0 & result > 0

  # Turn failed values to FALSE
  result[is.na(result)] <- FALSE
  # Get original missing values
  result[is.na(TARGET) | TARGET == ""] <- NA
  return(result)
}