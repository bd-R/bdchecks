#' @rdname dc_phylum_valid
#' 
#' @param input a vector of phylum information. To pass it must be within
#' gbif phylum ranks.
#' 
dc_phylum_valid <- function(input = NULL) {
  clean_input <- input %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- clean_input %in% tax_available_name(clean_input, "phylum")
  return(perform_dc_missing(result, clean_input))
}
