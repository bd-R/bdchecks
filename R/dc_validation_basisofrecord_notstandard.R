#' @rdname dc_validation_basisofrecord_notstandard
#' 
#' @param TARGET a vector of basisOfRecord information. To pass it must be
#' within given reference dictionary.
#' @param sources a vector of available sources.
#' 
dc_validation_basisofrecord_notstandard <- function(
  TARGET = NULL,
  sources = c(
    "event",
    "fossil",
    "fossilspecimen",
    "human",
    "humanobservation",
    "livingspecimen",
    "machineobservation",
    "materialsample",
    "occurrence",
    "preservedspecimen",
    "taxon"
  )
) {
  result <- TARGET %>%
    gsub(" ", "", .) %>% # Remove possible spaces
    gsub("_| |\\.|-", "", .) %>% # Remove seperators
    tolower()
  result <- result %in% sources
  return(perform_dc_missing(result, TARGET))
}