#' @rdname dc_validation_dateidentified_standard
#' 
#' @param TARGET a vector of dateIdentified information. To pass it must be a
#' valid ISO 8601-1:2019 date.
#' 
dc_validation_dateidentified_standard <- function(TARGET = NULL) {
  result <- TARGET %>%
    as.Date() %>% # Convert to date first so that following call would return NA
    as.POSIXct() %>% # Gives NA for non-valid date
    is.na()
  return(perform_dc_missing(!result, TARGET))
}