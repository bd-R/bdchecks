#' @rdname dc_validation_taxon_empty
#' 
#' @param TARGET a vector of taxon information. To pass it must be non-empty
#' entry. 
#' 
dc_validation_taxon_empty <- function(TARGET = NULL) {
  result <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- !is.na(result) & result != "" # Must be a some string present
  return(result)
}