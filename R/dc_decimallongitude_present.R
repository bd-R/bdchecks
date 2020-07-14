#' @rdname dc_decimallongitude_present
#' 
#' @param input a vector of decimallongitude information. To pass it must be
#' non-empty entry. 
#' 
dc_decimallongitude_present <- function(input = NULL) {
  clean_input <- input %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- !is.na(clean_input) & clean_input != "" # Check if not empty
  return(result)
}
