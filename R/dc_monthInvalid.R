#' @rdname dc_monthInvalid
#' 
#' @param TARGET a vector of a month
#' 
dc_monthInvalid <- function(TARGET) {
  result <- TARGET %>%
    trimws() %>% # Trim extra whitespace
    gsub(" ", "", .) %>% # Remove possible spaces
    as.numeric() # This is main criteria - value must be turned numeric
  # Must must be an integer between 1 and 12
  result <- result %% 1 == 0 & result >= 1 & result <= 12

  # Turn failed values to FALSE
  result[is.na(result)] <- FALSE
  # Get original missing values
  result[is.na(TARGET) | TARGET == ""] <- NA
  return(result)
}