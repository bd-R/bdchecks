#' @rdname dc_namePublishedYearInFuture
#' 
#' @param TARGET a vector of publishing year
#' 
dc_namePublishedYearInFuture <- function(TARGET) {
  current_year <- format(Sys.Date(), "%Y")
  result <- TARGET %>%
    gsub(" ", "", .) %>% # Trim extra whitespace
    as.numeric() # This is main criteria - value must be turned numeric
  # Year must be possitive and probably contain for digits
  result <- result > 0 & nchar(result) == 4 & result <= current_year
  return(perform_dc_missing(result, TARGET))
}