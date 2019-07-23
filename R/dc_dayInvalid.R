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
  return(perform_dc_missing(result, TARGET))
}