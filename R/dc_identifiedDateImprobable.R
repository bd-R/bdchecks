#' @rdname dc_identifiedDateImprobable
#' 
#' @param TARGET a vector of a date
#' @param date_Linnaeus a date for Linnaeus to start counting from
#' @param date_format a string for full date format
#' 
dc_identifiedDateImprobable <- function(
  TARGET,
  date_Linnaeus = "1753-01-01",
  date_format = "%Y-%m-%d"
) {

  result <- TARGET %>%
    trimws() %>% # Trim extra whitespace
    gsub("\\.", "-", .) # Turn wrong seprators into relevant -
  # Date must be between Linnaeus and current
  result <- as.Date(result, origin = "1970-01-01")
  result_1 <- result >= as.Date(date_Linnaeus, origin = "1970-01-01")
  result_2 <- result <= Sys.Date()
  result <- result_1 & result_2

  # Turn failed values to FALSE
  result[is.na(result)] <- FALSE
  # Get original missing values
  result[is.na(TARGET) | TARGET == ""] <- NA
  return(result)
}