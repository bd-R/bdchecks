#' @rdname dc_order_valid
#' 
#' @param TARGET a vector of order information. To pass it must be within
#' gbif order ranks.
#' 
dc_order_valid <- function(TARGET = NULL) {
  TARGET <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- TARGET %in% tax_available_name(TARGET, "order")
  return(perform_dc_missing(result, TARGET))
}