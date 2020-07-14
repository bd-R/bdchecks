#' @rdname dc_family_valid
#' 
#' @param input a vector of family information. To pass it must be within
#' gbif family ranks.
#' 
dc_family_valid <- function(input = NULL) {
  clean_input <- input %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- clean_input %in% tax_available_name(clean_input, "family")
  return(perform_dc_missing(result, clean_input))
}
