#' @rdname dc_datageneralizations_present
#' 
#' @param input a vector of data generalization information. 
#' 
dc_datageneralizations_present <- function(input = NULL) {
  clean_input <- input %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- !is.na(clean_input) & clean_input != "" # Check if not empty
  return(result)
}
