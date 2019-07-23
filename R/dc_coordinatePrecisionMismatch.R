#' @rdname dc_coordinatePrecisionMismatch
#' 
#' @param TARGET a vector of coordinates. To pass it's decimals must be less
#' than coordinate precision.
#' @param DEPEND a vector of coordinate precision.
#' 
dc_coordinatePrecisionMismatch <- function(TARGET, DEPEND) {
  options(scipen = 999)
  # Extract number of decimals
  n_target <- TARGET %>%
    gsub(" ", "", .) %>% # Trim extra whitespace & possible space
    as.character() %>%
    gsub("(.*\\.)|([0]*$)", "", .) %>% # Remote trailing information
    nchar()
  n_depend <- DEPEND %>%
    gsub(" ", "", .) %>% # Trim extra whitespace & possible space
    as.character() %>%
    gsub("(.*\\.)|([0]*$)", "", .) %>% # Remote trailing information
    nchar()
  # Main part - check if country is real
  result <- n_target <= n_depend
  return(perform_dc_missing(result, TARGET))
}