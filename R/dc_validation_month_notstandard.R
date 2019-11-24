#' @rdname dc_validation_month_notstandard
#' 
#' @param TARGET a vector of month information. To pass must be an integer
#' between 1 and 12.
#' 
dc_validation_month_notstandard <- function(TARGET = NULL) {
  result <- TARGET %>%
    gsub(" ", "", .) %>% # Remove possible spaces
    as.numeric()
  result <- result %% 1 == 0 & result >= 1 & result <= 12
  return(perform_dc_missing(result, TARGET))
}