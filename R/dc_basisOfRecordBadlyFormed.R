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
  return(perform_dc_missing(result, TARGET))
}