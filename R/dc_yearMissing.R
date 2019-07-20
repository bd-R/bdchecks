#' @rdname dc_yearMissing
#' 
#' @param TARGET a vector of year information
#' 
#' @importFrom magrittr "%>%"
#'
dc_yearMissing <- function(TARGET) {
  result <- TARGET %>%
    trimws() %>% # Trim extra whitespace
    as.numeric() # This is main criteria - value must be turned numeric
  # Year must be possitive and probably contain for digits
  result <- result > 0 & nchar(result) == 4

  # Turn failed values to FALSE
  result[is.na(result)] <- FALSE
  # Get original missing values
  result[is.na(TARGET) | TARGET == ""] <- NA
  return(result)
}