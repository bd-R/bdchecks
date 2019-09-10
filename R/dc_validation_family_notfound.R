#' @rdname dc_validation_family_notfound
#' 
#' @param TARGET a vector of family information. To pass it must be within
#' gbif family ranks.
#' 
dc_validation_family_notfound <- function(TARGET = NULL) {
  TARGET <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- TARGET %in% tax_available_name(TARGET, "family")
  return(perform_dc_missing(result, TARGET))
}