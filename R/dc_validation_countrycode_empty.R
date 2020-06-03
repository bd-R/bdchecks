#' @rdname dc_countrycode_present
#' 
#' @param TARGET a vector of countryCode information. To pass it must be
#' non-empty entry. 
#' 
dc_countrycode_present <- function(TARGET = NULL) {
  result <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- !is.na(result) & result != "" # Check if not empty
  return(result)
}