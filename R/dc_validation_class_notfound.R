#' @rdname dc_validation_class_notfound
#' 
#' @param TARGET a vector of class information. To pass it must be within
#' gbif class ranks.
#' 
dc_validation_class_notfound <- function(TARGET = NULL) {
  TARGET <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- TARGET %in% tax_available_name(TARGET, "class")
  return(perform_dc_missing(result, TARGET))
}