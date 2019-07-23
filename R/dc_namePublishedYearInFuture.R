#' @rdname dc_namePublishedYearInFuture
#' 
#' @param TARGET a vector of publishing year information. To pass it must be
#' a numeric, positive, four digit value, less or equal to current year.
#' 
dc_namePublishedYearInFuture <- function(TARGET) {
  result <- TARGET %>%
    gsub(" ", "", .) %>% # Remove possible spaces
    as.numeric() # Value must be turned numeric
  # Year must be possitive and contain four digits
  current_year <- format(Sys.Date(), "%Y")
  result <- result > 0 & nchar(result) == 4 & result <= current_year
  return(perform_dc_missing(result, TARGET))
}