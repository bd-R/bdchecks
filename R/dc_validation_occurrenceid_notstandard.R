#' @rdname dc_occurrenceid_standard
#' 
#' @param TARGET a vector of occurence ID. To pass must be match a GUID style.
#' 
dc_occurrenceid_standard <- function(TARGET = NULL) {
  result <- TARGET %>%
    tolower() %>%
    gsub(" ", "", .) %>% # Remove possible spaces
    grepl("^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[0-9a-f]{4}-[0-9a-f]{12}$", .)
  return(perform_dc_missing(result, TARGET))
}
