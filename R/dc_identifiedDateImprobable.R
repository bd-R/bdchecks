#' @rdname dc_identifiedDateImprobable
#' 
#' @param TARGET a vector of identification date. To pass must be a valid
#' format between Linnaeus and present.
#' @param date_Linnaeus a date for Linnaeus to start counting from.
#' @param date_format a string for full date format.
#' 
dc_identifiedDateImprobable <- function(
  TARGET,
  date_Linnaeus = "1753-01-01",
  date_format = "%Y-%m-%d"
) {
  result <- TARGET %>%
    gsub(" ", "", .) %>% # Remove possible spaces
    gsub("\\.", "-", .) %>% # Turn wrong seprators into relevant -
    as.Date(origin = "1970-01-01", format = date_format)
  # Date must be between Linnaeus and current
  result_1 <- result >= as.Date(date_Linnaeus, origin = "1970-01-01")
  result_2 <- result <= Sys.Date()
  result <- result_1 & result_2
  return(perform_dc_missing(result, TARGET))
}