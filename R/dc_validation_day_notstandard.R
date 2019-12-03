#' @rdname dc_validation_day_notstandard
#' 
#' @param TARGET a vector of day information. To pass must be an integer
#' within 1 and 31.
#' 
dc_validation_day_notstandard <- function(TARGET = NULL) {
  suppressWarnings(
    result <- TARGET %>%
      gsub(" ", "", .) %>% # Remove possible spaces
      as.numeric()
  )
  result <- result %% 1 == 0 & result >= 1 & result <= 31
  return(perform_dc_missing(result, TARGET))
}