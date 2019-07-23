#' @rdname dc_basisOfRecordBadlyFormed
#' 
#' @param TARGET a vector of records
#' @param records a vector of reference records
#' 
dc_basisOfRecordBadlyFormed <- function(
  TARGET,
  records = c(
    "HumanObservation",
    "FossilSpecimen",
    "LivingSpecimen",
    "MachineObservation",
    "PreservedSpecimen"
  )
) {
  result <- TARGET %>%
    gsub(" ", "", .) %>% # Trim extra whitespace & possible space
    tolower() # Match case
  result <- result %in% tolower(records)

  # Turn failed values to FALSE
  result[is.na(result)] <- FALSE
  # Get original missing values
  result[is.na(TARGET) | TARGET == ""] <- NA
  return(result)
}