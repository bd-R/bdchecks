#' @rdname dc_genus_valid
#' 
#' @param TARGET a vector of genus information. To pass it must be within
#' gbif genus ranks.
#' 
dc_genus_valid <- function(TARGET = NULL) {
  TARGET <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- TARGET %in% tax_available_name(TARGET, "genus")
  return(perform_dc_missing(result, TARGET))
}