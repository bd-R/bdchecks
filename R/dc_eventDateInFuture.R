#' @rdname dc_eventDateInFuture
#' 
#' @param TARGET a vector of event date information
#' @param date_separator regex string to turn date separators,
#' e.g., dot into "-"
#' 
#' @importFrom magrittr "%>%"
#' 
dc_eventDateInFuture <- function(TARGET, date_separator = "\\.| ") {
  result <- TARGET %>%
    trimws() %>% # Trim extra whitespace
    gsub(date_separator, "-", .) %>% # Turn wrong seprators into relevant -
    as.Date(origin = "1970-01-01") # Turn or correct values into a date
  # Main part - check if date is less than current time
  result <- result <= Sys.Date()

  # Turn failed values to FALSE
  result[is.na(result)] <- FALSE
  # Get original missing values
  result[is.na(TARGET) | TARGET == ""] <- NA
  return(result)
}