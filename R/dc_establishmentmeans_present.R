#' @rdname dc_establishmentmeans_present
#' 
#' @param input a vector of establishment means information. 
#' 
dc_establishmentmeans_present <- function(input = NULL) {
  clean_input <- input %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- !is.na(clean_input) & clean_input != "" # Check if not empty
  return(result)
}
