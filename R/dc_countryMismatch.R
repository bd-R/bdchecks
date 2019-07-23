#' @rdname dc_countryMismatch
#' 
#' @param TARGET a vector of country names. To pass it's name must match
#' country code in reference set.
#' @param DEPEND a vector of country codes.
#' @param path_reference path to reference set of country names.
#' 
dc_countryMismatch <- function(
  TARGET,
  DEPEND,
  path_reference = system.file("extdata/isocodes.csv", package = "bdchecks")
) {
  reference <- read.csv(path_reference)
  result <- TARGET %>%
    tolower() %>%
    gsub(" ", "", .) # Remove possible spaces
  depend_mod <- DEPEND %>%
    tolower() %>%
    gsub(" ", "", .) # Remove possible spaces
   # Main part - check if country codes match
  result <- tolower(reference$code[match(result, tolower(reference$name))])
  result <- result == depend_mod
  return(perform_dc_missing(result, TARGET))
}