#' @rdname dc_validation_order_notfound
#' 
#' @param TARGET a vector of order information. To pass it must be within
#' gbif order ranks.
#' 
dc_validation_order_notfound <- function(TARGET = NULL) {
  TARGET <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- TARGET %in% tax_available_name(TARGET, "order")
  return(perform_dc_missing(result, TARGET))
}