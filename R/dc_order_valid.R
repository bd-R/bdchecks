#' @rdname dc_order_valid
#' 
#' @param input a vector of order information. To pass it must be within
#' gbif order ranks.
#' 
dc_order_valid <- function(input = NULL) {
  clean_input <- input %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- clean_input %in% tax_available_name(clean_input, "order")
  return(perform_dc_missing(result, clean_input))
}
