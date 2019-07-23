#' @rdname dc_monthInvalid
#' 
#' @param TARGET a vector of month. To pass it must be an integer value between 1
#' and 12.
#' 
dc_monthInvalid <- function(TARGET) {
  result <- TARGET %>%
    gsub(" ", "", .) %>% # Remove possible spaces
    as.numeric() # Value must be turned numeric
  # Must must be an integer between 1 and 12
  result <- result %% 1 == 0 & result >= 1 & result <= 12
  return(perform_dc_missing(result, TARGET))
}