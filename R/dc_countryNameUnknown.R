#' @rdname dc_countryNameUnknown
#' 
#' @param TARGET a vector of country names. To pass must be within given
#' reference set.
#' @param path_reference path to reference set of country names.
#' 
dc_countryNameUnknown <- function(
  TARGET,
  path_reference = system.file("extdata/isocodes.csv", package = "bdchecks")
) {
  reference <- read.csv(path_reference)
  result <- TARGET %>%
    tolower() %>%
    gsub(" ", "", .) # Remove possible spaces
  # Main part - check if country is real
  result <- result %in% tolower(reference$name)
  return(perform_dc_missing(result, TARGET))
}