#' @rdname dc_classUnknown
#' 
#' @param TARGET a vector of classes. To pass must be within given classes set.
#' @param classes a vector of reference classes.
#' 
dc_classUnknown <- function(
  TARGET,
  classes = c(
    "mammalia", "mammals",
    "aves", "birds",
    "reptilia", "reptiles",
    "amphibia", "amphibians"
  )
) {
  result <- TARGET %>%
    tolower() %>%
    gsub(" ", "", .) # Remove possible spaces
  # Check if submitted class is in reference 
  result_1 <- result %in% tolower(classes)
  result_2 <- sub("s$", "", result) %in% sub("s$", "", classes)
  result <- result_1 | result_2
  return(perform_dc_missing(result, TARGET))
}