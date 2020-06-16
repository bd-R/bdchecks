#' @rdname dc_class_valid
#' 
#' @param input a vector of class information. To pass it must be within
#' gbif class ranks.
#' 
dc_class_valid <- function(input = NULL) {
  clean_input <- input %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- clean_input %in% tax_available_name(clean_input, "class")
  return(perform_dc_missing(result, clean_input))
}
