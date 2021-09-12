#' @rdname dc_eventdate_standard
#' 
#' @param input a vector of eventDate information. To pass it must be a valid 
#' ISO 8601-1:2019 date.
#' 
dc_eventdate_standard <- function(input = NULL) {
  result <- input %>%
    # Convert to date first so that following call would return NA
    strptime(., format = "%Y-%m-%d") %>%
    as.POSIXct() %>% # Gives NA for non-valid date
    is.na()
  return(perform_dc_missing(!result, input))
}
