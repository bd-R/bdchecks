#' @rdname dc_occurrencestatus_standard
#' 
#' @param input a vector of occurrenceStatus information. To pass it must be
#' within given reference dictionary.
#' @param sources a vector of available sources.
#' 
dc_occurrencestatus_standard <- function(
  input = NULL,
  sources = c(
    "present",
    "absent"
  )
) {
  clean_input <- input %>%
    gsub(" ", "", .) %>% # Remove possible spaces
    gsub("_| |\\.|-", "", .) %>% # Remove seperators
    tolower()
  result <- clean_input %in% sources
  return(perform_dc_missing(result, input))
}
