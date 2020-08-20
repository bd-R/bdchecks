#' @rdname dc_country_countrycode_consistent
#' 
#' @param input a vector of country information.
#' country name (checked against data_countries reference dataset).
#' @param input2 a vector of country code information.
#' country code (checked against data_countries reference dataset).
#' 
dc_country_countrycode_consistent <- function(
  input = NULL,
  input2 = NULL
) {
  clean_input1 <- input %>%
    trimws() %>% 
    tolower()
  clean_input2 <- input2 %>%
    trimws() %>% 
    tolower()
  cn <- tolower(data_countries$country_name)
  cc <- tolower(data_countries$country_code)

  res1 <- unlist(lapply(clean_input1, function(x) which(cn == x)))
  res2 <- unlist(lapply(clean_input2, function(x) which(cc == x)))
  
  result <- as.numeric(res1) == as.numeric(res2)
  foo <- perform_dc_missing(result, input)
  bar <- perform_dc_missing(result, input2)

  return(foo + bar == 2)
}
