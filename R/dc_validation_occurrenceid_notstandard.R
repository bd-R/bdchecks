#' @rdname dc_validation_occurrenceid_notstandard
#' 
#' @param TARGET a vector of taxon rank. To pass must be within given
#' dictionary.
#' 
dc_validation_occurrenceid_notstandard <- function(TARGET = NULL) {
  result <- TARGET %>%
    tolower() %>%
    gsub(" ", "", .) %>% # Remove possible spaces
    grepl("^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[0-9a-f]{4}-[0-9a-f]{12}$", .)
  result <- result %in% tolower(data_reference$term)
  return(perform_dc_missing(result, TARGET))
}
