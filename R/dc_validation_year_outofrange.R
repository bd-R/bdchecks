#' @rdname dc_validation_year_outofrange
#' 
#' @param TARGET a vector of year information. To pass must be within 
#' given dates (start and end).
#' @param date_start earliest possible date.
#' @param date_end latest possible date.
#' 
dc_validation_year_outofrange <- function(
  TARGET = NULL,
  date_start = "1600",
  date_end = format(Sys.Date(), "%Y")
) {
  suppressWarnings(
    result <- TARGET %>%
      gsub(" ", "", .) %>% # Remove possible spaces
      as.numeric()
  )
  result <- (result >= as.numeric(date_start) & result <= as.numeric(date_end))
  return(perform_dc_missing(result, TARGET))
}