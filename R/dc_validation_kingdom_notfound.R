#' @rdname dc_validation_kingdom_notfound
#' 
#' @param TARGET a vector of kingdom information. To pass it must be within
#' gbif kingdom ranks.
#' 
dc_validation_kingdom_notfound <- function(TARGET = NULL) {
  TARGET <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- TARGET %in% tax_available_name(TARGET, "kingdom")
  return(perform_dc_missing(result, TARGET))
}