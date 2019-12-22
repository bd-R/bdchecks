#' @rdname dc_validation_occurrencestatus_notstandard
#' 
#' @param TARGET a vector of occurrenceStatus information. To pass it must be
#' within given reference dictionary.
#' @param sources a vector of available sources.
#' 
dc_validation_occurrencestatus_notstandard <- function(
  TARGET = NULL,
  sources = c(
    "present",
    "absent"
  )
) {
  result <- TARGET %>%
    gsub(" ", "", .) %>% # Remove possible spaces
    gsub("_| |\\.|-", "", .) %>% # Remove seperators
    tolower()
  result <- result %in% sources
  return(perform_dc_missing(result, TARGET))
}