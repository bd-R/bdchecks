#' @rdname dc_family_valid
#' 
#' @param TARGET a vector of family information. To pass it must be within
#' gbif family ranks.
#' 
dc_family_valid <- function(TARGET = NULL) {
  TARGET <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- TARGET %in% tax_available_name(TARGET, "family")
  return(perform_dc_missing(result, TARGET))
}