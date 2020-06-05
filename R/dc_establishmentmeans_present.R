#' @rdname dc_establishmentmeans_present
#' 
#' @param TARGET a vector of establishment means information. 
#' 
dc_establishmentmeans_present <- function(TARGET = NULL) {
  result <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- !is.na(result) & result != "" # Check if not empty
  return(result)
}