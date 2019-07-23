#' @rdname dc_countryNameUnknown
#' 
#' @param TARGET a vector of country names
#' 
dc_countryNameUnknown <- function(TARGET) {
  result <- TARGET %>%
    gsub(" ", "", .) %>% # Trim extra whitespace & possible space
    tolower() # Match case
  # Main part - check if country is real
  result <- result %in% tolower(countries)
  return(perform_dc_missing(result, TARGET))
}