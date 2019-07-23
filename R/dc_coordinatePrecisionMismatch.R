#' @rdname dc_coordinatePrecisionMismatch
#' 
#' @param TARGET a vector of coordinates
#' @param DEPEND a vector of coordinate precision
#' 
dc_coordinatePrecisionMismatch <- function(TARGET, DEPEND) {
  # Extract number of decimals
  n_target <- TARGET %>%
    gsub(" ", "", .) %>% # Trim extra whitespace & possible space
    as.character() %>%
    gsub("(.*\\.)|([0]*$)", "", ) %>% # Remote trailing information
    nchar()
  n_depend <- DEPEND %>%
    gsub(" ", "", .) %>% # Trim extra whitespace & possible space
    as.character() %>%
    gsub("(.*\\.)|([0]*$)", "", ) %>% # Remote trailing information
    nchar()
  # Main part - check if country is real
  result <- n_target <= n_depend
  return(perform_dc_missing(result, TARGET))
}