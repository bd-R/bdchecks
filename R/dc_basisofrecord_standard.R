#' @rdname dc_basisofrecord_standard
#' 
#' @param input a vector of basisOfRecord information. To pass it must be
#' within given reference dictionary.
#' @param sources a vector of available sources.
#' 
dc_basisofrecord_standard <- function(
  input = NULL,
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
    "photo",
    "photos",
    "taxon"
  )
) {
  clean_input <- input %>%
    gsub(" ", "", .) %>% # Remove possible spaces
    gsub("_| |\\.|-", "", .) %>% # Remove seperators
    tolower()
  result <- clean_input %in% sources
  return(perform_dc_missing(result, input))
}
