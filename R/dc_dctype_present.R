#' @rdname dc_dctype_present
#' 
#' @param input a vector of dctype information. To pass it must be
#' non-empty entry. 
#' 
dc_dctype_present <- function(input = NULL) {
  clean_input <- input %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- !is.na(clean_input) & clean_input != "" # Check if not empty
  return(result)
}
