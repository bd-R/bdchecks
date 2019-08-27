#' @rdname dc_validation_taxonrank_empty
#' 
#' @param TARGET a vector of taxonrank information. To pass it must be non-empty
#' entry. 
#' 
dc_validation_taxonrank_empty <- function(TARGET = NULL) {
  result <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- !is.na(result) & result != "" # Must be a some string present
  return(result)
}