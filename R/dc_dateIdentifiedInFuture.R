#' @rdname dc_dateIdentifiedInFuture
#' 
#' @param TARGET a vector of a date
#' @param date_format a string for full date format
#' 
dc_dateIdentifiedInFuture <- function(TARGET, date_format = "%Y-%m-%d") {
  result <- TARGET %>%
    trimws() %>% # Trim extra whitespace
    gsub("\\.", "-", .) # Turn wrong seprators into relevant -
  result <- as.Date(result, origin = "1970-01-01") <= Sys.Date()
  return(perform_dc_missing(result, TARGET))
}