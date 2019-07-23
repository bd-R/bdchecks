#' @rdname dc_basisOfRecordBadlyFormed
#' 
#' @param TARGET a vector of records. To pass must be within given records set.
#' @param records a vector of reference records.
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
    tolower() %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- result %in% tolower(records)
  return(perform_dc_missing(result, TARGET))
}