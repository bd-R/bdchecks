#' @rdname dc_earliest_date
#' 
#' @param input a vector of event date information. To pass must be greater 
#' than inputted resolution.
#' @param resolution a date for the lowest date required.
#' 
dc_earliest_date <- function(
    input = NULL,
    resolution = "2018-02-02"
) {
  clean_input <- input %>%
    gsub(" ", "", .) # Remove possible spaces
  clean_input <- ifelse(clean_input == "", NA, clean_input) %>%
    as.Date(origin = "1970-01-01")
  result <- (clean_input >= as.Date(resolution, origin = "1970-01-01"))
  return(perform_dc_missing(result, input))
}

