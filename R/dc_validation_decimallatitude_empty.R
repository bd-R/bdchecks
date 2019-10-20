#' @rdname dc_validation_decimallatitude_empty
#' 
#' @param TARGET a vector of decimallatitude information. To pass it must be
#' non-empty entry. 
#' 
dc_validation_decimallatitude_empty <- function(TARGET = NULL) {
  result <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- !is.na(result) & result != "" # Check if not empty
  return(result)
}