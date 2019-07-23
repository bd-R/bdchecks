#' @rdname dc_yearMissing
#' 
#' @param TARGET a vector of year information. To pass it must be a numeric,
#' positive, four digit value.
#' 
dc_yearMissing <- function(TARGET) {
  result <- TARGET %>%
    gsub(" ", "", .) %>% # Remove possible spaces
    as.numeric() # Value must be turned numeric
  # Year must be possitive and contain four digits
  result <- result > 0 & nchar(result) == 4
  return(perform_dc_missing(result, TARGET))
}