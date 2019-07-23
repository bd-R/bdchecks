#' @rdname dc_dayInvalid
#' 
#' @param TARGET a vector of a day
#' 
dc_dayInvalid <- function(TARGET) {
  result <- TARGET %>%
    gsub(" ", "", .) %>% # Remove possible spaces
    as.numeric() # This is main criteria - value must be turned numeric
  # Day must be an integer between 1 and 31
  result <- result %% 1 == 0 & result >= 1 & result <= 31

  # Turn failed values to FALSE
  result[is.na(result)] <- FALSE
  # Get original missing values
  result[is.na(TARGET) | TARGET == ""] <- NA
  return(result)
}