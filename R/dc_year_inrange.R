#' @rdname dc_year_inrange
#' 
#' @param input a vector of year information. To pass must be within 
#' given dates (start and end).
#' @param date_start earliest possible date.
#' @param date_end latest possible date.
#' 
dc_year_inrange <- function(
  input = NULL,
  date_start = "1600",
  date_end = format(Sys.Date(), "%Y")
) {
  suppressWarnings(
    clean_input <- input %>%
      gsub(" ", "", .) %>% # Remove possible spaces
      as.numeric()
  )
  result <- (clean_input >= as.numeric(date_start) & clean_input <= as.numeric(date_end))
  return(perform_dc_missing(result, input))
}
