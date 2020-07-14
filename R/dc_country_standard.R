#' @rdname dc_country_standard
#' 
#' @param input a vector of country information. To pass must be a valid
#' country name (checked against data_countries reference dataset).
#' 
dc_country_standard <- function(input = NULL) {
  result <- trimws(input) %in% data_countries$country_name
  return(perform_dc_missing(result, input))
}
