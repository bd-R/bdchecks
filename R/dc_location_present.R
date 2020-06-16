#' @rdname dc_location_present
#' 
#' @param input a vector of location information. To pass it must be non-empty
#' entry. 
#' 
dc_location_present <- function(input = NULL) {
  clean_input <- input %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- !is.na(clean_input) & clean_input != "" # Check if not empty
  return(result)
}
