#' @rdname dc_validation_eventdate_notstandard
#' 
#' @param TARGET a vector of eventDate information. To pass it must be a valid 
#' ISO 8601-1:2019 date.
#' 
dc_validation_eventdate_notstandard <- function(TARGET = NULL) {
  result <- TARGET %>%
    as.Date() %>% # Convert to date first so that following call woul return NA
    as.POSIXct() %>% # Gives NA for non-valid date
    is.na()
  return(perform_dc_missing(!result, TARGET))
}