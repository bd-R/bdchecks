#' @rdname dc_eventDateInFuture
#' 
#' @param TARGET a vector of event date information
#' @param date_format a string for full date format
#' 
dc_dateNull <- function(TARGET, date_format = "%Y-%m-%d") {
  result <- TARGET %>%
    trimws() %>% # Trim extra whitespace
    gsub("\\.", "-", .) # Turn wrong seprators into relevant -

  # Try to check if only year is present
  result_year <- dc_yearMissing(ifelse(nchar(result) == 4, result, NA))
  # Try to check if full date is present
  result_full <- !is.na(as.Date(result, format = date_format))

  result <- result_full | result_year
  # Turn failed values to FALSE
  result[is.na(result)] <- FALSE
  # Get original missing values
  result[is.na(TARGET) | TARGET == ""] <- NA
  return(result)
}