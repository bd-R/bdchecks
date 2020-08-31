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

  res1 <- paste(clean_input1, clean_input2, sep = "_")
  res2 <- paste(cn, cc, sep = "_")

  result <- res1 %in% res2
  foo <- perform_dc_missing(result, input)
  bar <- perform_dc_missing(result, input2)

  return(foo + bar == 2)
}
