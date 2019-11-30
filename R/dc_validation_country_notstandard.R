#' @rdname dc_validation_country_notstandard
#' 
#' @param TARGET a vector of country information. To pass must be a valid
#' country name (checked against data_countries reference dataset).
#' 
dc_validation_country_notstandard <- function(TARGET = NULL) {
  result <- trimws(TARGET) %in% data_countries$country_name
  return(perform_dc_missing(result, TARGET))
}