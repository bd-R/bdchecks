#' @rdname dc_datageneralizations_present
#' 
#' @param TARGET a vector of data generalization information. 
#' 
dc_datageneralizations_present <- function(TARGET = NULL) {
  result <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- !is.na(result) & result != "" # Check if not empty
  return(result)
}