#' @rdname dc_month_standard
#' 
#' @param input a vector of month information. To pass must be an integer
#' within 1 and 12.
#' 
dc_month_standard <- function(input = NULL) {
  suppressWarnings(
    clean_input <- input %>%
      gsub(" ", "", .) %>% # Remove possible spaces
      as.numeric()
  )
  result <- clean_input %% 1 == 0 & clean_input >= 1 & clean_input <= 12
  return(perform_dc_missing(result, input))
}
