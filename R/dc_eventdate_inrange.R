#' @rdname dc_eventdate_inrange
#' 
#' @param TARGET a vector of event date information. To pass must be within 
#' given dates (start and end).
#' @param date_start earliest possible date.
#' @param date_end latest possible date.
#' 
dc_eventdate_inrange <- function(
  TARGET = NULL,
  date_start = "1600-01-01",
  date_end = Sys.Date()
) {
  result <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- ifelse(result == "", NA, result) %>%
    as.Date(origin = "1970-01-01")
  result <- (
    result >= as.Date(date_start, origin = "1970-01-01") & 
    result <= as.Date(date_end, origin = "1970-01-01")
  )
  return(perform_dc_missing(result, TARGET))
}