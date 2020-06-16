#' @rdname dc_genus_valid
#' 
#' @param input a vector of genus information. To pass it must be within
#' gbif genus ranks.
#' 
dc_genus_valid <- function(input = NULL) {
  clean_input <- input %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- clean_input %in% tax_available_name(clean_input, "genus")
  return(perform_dc_missing(result, clean_input))
}
