#' @rdname dc_validation_continent_notstandard
#' 
#' @param TARGET a vector of continent information. To pass it must be
#' within given reference dictionary.
#' @param sources a vector of available sources.
#' 
dc_validation_continent_notstandard <- function(
  TARGET = NULL,
  sources = c(
    "asia",
    "africa",
    "europe",
    "north america",
    "south america",
    "australia",
    "oceania",
    "antarctica",
    "eurasia", 
    "america"
  )
) {
  result <- TARGET %>%
    gsub("^ |\\ $", "", .) %>% # Remove non-essential spaces
    gsub("_|\\.|-", " ", .) %>% # Replace seperators with space
    tolower()
  result <- result %in% sources
  return(perform_dc_missing(result, TARGET))
}
