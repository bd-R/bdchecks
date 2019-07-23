#' @rdname dc_dayInvalid
#' 
#' @param TARGET a vector of day. To pass it must be an integer value between 1
#' and 31.
#' 
dc_dayInvalid <- function(TARGET) {
  result <- TARGET %>%
    gsub(" ", "", .) %>% # Remove possible spaces
    as.numeric() # Value must be turned numeric
  # Day must be an integer between 1 and 31
  result <- result %% 1 == 0 & result >= 1 & result <= 31
  return(perform_dc_missing(result, TARGET))
}