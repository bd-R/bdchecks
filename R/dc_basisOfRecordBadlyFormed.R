#' @rdname dc_basisOfRecordBadlyFormed
dc_basisOfRecordBadlyFormed <- function(TARGET) {
  VOCABULARY <- c(
    "PreservedSpecimen", 
    "FossilSpecimen", 
    "LivingSpecimen", 
    "HumanObservation", 
    "MachineObservation"
  )
  TARGETmod <- gsub("_| ", "", TARGET)
  tolower(TARGETmod) %in% tolower(VOCABULARY)
}
