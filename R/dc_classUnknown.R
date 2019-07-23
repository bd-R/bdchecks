#' @rdname dc_classUnknown
#' 
#' @param TARGET a vector of species classes
#' @param classes a vector of reference classes
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
    trimws() %>% # Trim extra whitespace
    tolower() # Match case

  # Check if submitted class is in reference 
  result_1 <- result %in% classes
  result_2 <- sub("s$", "", result) %in% sub("s$", "", classes)
  result <- result_1 | result_2

  # Turn failed values to FALSE
  result[is.na(result)] <- FALSE
  # Get original missing values
  result[is.na(TARGET) | TARGET == ""] <- NA
  return(result)
}
