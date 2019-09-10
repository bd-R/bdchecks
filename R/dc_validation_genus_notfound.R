#' @rdname dc_validation_genus_notfound
#' 
#' @param TARGET a vector of genus information. To pass it must be within
#' gbif genus ranks.
#' 
dc_validation_genus_notfound <- function(TARGET = NULL) {
  TARGET <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- TARGET %in% tax_available_name(TARGET, "genus")
  return(perform_dc_missing(result, TARGET))
}