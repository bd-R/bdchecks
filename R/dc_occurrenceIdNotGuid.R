#' @rdname dc_occurrenceIdNotGuid
#' 
#' @param TARGET a vector of globally uniquely identifier. To pass must match
#' provided regex.
#' @param guid regex string used to capture globally uniquely identifier.
#' 
dc_occurrenceIdNotGuid <- function(
  TARGET,
  guid = "^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[0-9a-f]{4}-[0-9a-f]{12}$"
) {
  result <- TARGET %>%
    tolower() %>%
    gsub(" ", "", .) %>% # Remove possible spaces
    grepl(guid, .)
  return(perform_dc_missing(result, TARGET))
}
