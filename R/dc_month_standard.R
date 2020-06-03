#' @rdname dc_month_standard
#' 
#' @param TARGET a vector of month information. To pass must be an integer
#' within 1 and 12.
#' 
dc_month_standard <- function(TARGET = NULL) {
  suppressWarnings(
    result <- TARGET %>%
      gsub(" ", "", .) %>% # Remove possible spaces
      as.numeric()
  )
  result <- result %% 1 == 0 & result >= 1 & result <= 12
  return(perform_dc_missing(result, TARGET))
}