#' @rdname dc_validation_phylum_notfound
#' 
#' @param TARGET a vector of phylum information. To pass it must be within
#' gbif phylum ranks.
#' 
dc_validation_phylum_notfound <- function(TARGET = NULL) {
  TARGET <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- TARGET %in% tax_available_name(TARGET, "phylum")
  return(perform_dc_missing(result, TARGET))
}