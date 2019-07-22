#' @rdname dc_coordinatesZero
#' 
#' @param TARGET a vector of event date information
#' @param date_format a string for full date format
#' 
#' @importFrom magrittr "%>%"
#' 
dc_coordinatesZero <- function(TARGET) {
  TARGET != 0
  result <- TARGET %>%
    trimws() %>% # Trim extra whitespace
    as.numeric() # Value must be turned numeric
  # Main part - check if value is equal to one
  result <- result == 1

  # Turn failed values to FALSE
  result[is.na(result)] <- FALSE
  # Get original missing values
  result[is.na(TARGET) | TARGET == ""] <- NA
  return(result)
}