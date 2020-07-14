#' @rdname dc_kingdom_valid
#' 
#' @param input a vector of kingdom information. To pass it must be within
#' gbif kingdom ranks.
#' 
dc_kingdom_valid <- function(input = NULL) {
  clean_input <- input %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- clean_input %in% tax_available_name(clean_input, "kingdom")
  return(perform_dc_missing(result, clean_input))
}
