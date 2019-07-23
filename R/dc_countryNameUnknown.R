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

  # Turn failed values to FALSE
  result[is.na(result)] <- FALSE
  # Get original missing values
  result[is.na(TARGET) | TARGET == ""] <- NA
  return(result)
}