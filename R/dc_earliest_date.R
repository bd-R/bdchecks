#' @rdname dc_earliest_date
#' 
#' @param input a vector of event date information. To pass must be greater 
#' than provided resolution.
#' @param lowest_date a date for the lowest date required.
#' @param ... to allow other input-based to run simultaneously.
#' 
dc_earliest_date <- function(
    input = NULL,
    lowest_date = "2018-02-02",
    ...
) {
  # tdwg_standard check
  passed <- get(paste0("dc_", "eventdate_inrange"))(input)
  clean_input <- input %>%
    gsub(" ", "", .) # Remove possible spaces
  clean_input <- ifelse(clean_input == "", NA, clean_input) %>%
    as.Date(origin = "1970-01-01")
  result <- (
  	clean_input[passed] >= as.Date(lowest_date, origin = "1970-01-01")
  )
  return(perform_dc_missing(result, input))
}

