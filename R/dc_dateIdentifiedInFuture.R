#' @rdname dc_dateIdentifiedInFuture
#' 
#' @param TARGET a vector of a date information. To pass must be a valid format
#' in the past.
#' @param date_format a string for full date format.
#' 
dc_dateIdentifiedInFuture <- function(TARGET, date_format = "%Y-%m-%d") {
  result <- TARGET %>%
    gsub(" ", "", .) %>% # Remove possible spaces
    gsub("\\.", "-", .) %>% # Turn wrong seprators into relevant -
    as.Date(origin = "1970-01-01", format = date_format)
  result <- result <= Sys.Date()
  return(perform_dc_missing(result, TARGET))
}