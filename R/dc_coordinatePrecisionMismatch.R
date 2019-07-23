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

  # Turn failed values to FALSE
  result[is.na(result)] <- FALSE
  # Get original missing values
  result[is.na(TARGET) | TARGET == ""] <- NA
  return(result)
}