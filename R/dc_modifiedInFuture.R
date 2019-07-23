#' @rdname dc_modifiedInFuture
#' 
#' @param TARGET a vector of a date
#' @param date_format a string for full date format
#' 
dc_modifiedInFuture <- function(TARGET, date_format = "%Y-%m-%d") {

  result <- TARGET %>%
    trimws() %>% # Trim extra whitespace
    gsub("\\.", "-", .) # Turn wrong seprators into relevant -
  result <- as.Date(result, origin = "1970-01-01") <= Sys.Date()

  # Turn failed values to FALSE
  result[is.na(result)] <- FALSE
  # Get original missing values
  result[is.na(TARGET) | TARGET == ""] <- NA
  return(result)
}