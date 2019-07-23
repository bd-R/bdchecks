#' @rdname dc_eventDateInFuture
#' 
#' @param TARGET a vector of event date information
#' @param date_separator regex string to turn date separators,
#' e.g., dot into "-"
#' 
dc_eventDateInFuture <- function(TARGET, date_separator = "\\.| ") {
  result <- TARGET %>%
    trimws() %>% # Trim extra whitespace
    gsub(date_separator, "-", .) %>% # Turn wrong seprators into relevant -
    as.Date(origin = "1970-01-01") # Turn or correct values into a date
  # Main part - check if date is less than current time
  result <- result <= Sys.Date()
  return(perform_dc_missing(result, TARGET))
}