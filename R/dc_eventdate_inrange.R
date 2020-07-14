#' @rdname dc_eventdate_inrange
#' 
#' @param input a vector of event date information. To pass must be within 
#' given dates (start and end).
#' @param date_start earliest possible date.
#' @param date_end latest possible date.
#' 
dc_eventdate_inrange <- function(
  input = NULL,
  date_start = "1600-01-01",
  date_end = Sys.Date()
) {
  clean_input <- input %>%
    gsub(" ", "", .) # Remove possible spaces
  clean_input <- ifelse(clean_input == "", NA, clean_input) %>%
    as.Date(origin = "1970-01-01")
  result <- (
    clean_input >= as.Date(date_start, origin = "1970-01-01") & 
    clean_input <= as.Date(date_end, origin = "1970-01-01")
  )
  return(perform_dc_missing(result, input))
}
