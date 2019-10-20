#' @rdname dc_validation_location_empty
#' 
#' @param TARGET a vector of location information. To pass it must be non-empty
#' entry. 
#' 
dc_validation_location_empty <- function(TARGET = NULL) {
  result <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- !is.na(result) & result != "" # Check if not empty
  return(result)
}