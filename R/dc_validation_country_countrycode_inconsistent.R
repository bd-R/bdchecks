#' @rdname dc_validation_country_countrycode_inconsistent
#' 
#' @param TARGET a vector of country information.
#' country name (checked against data_countries reference dataset).
#' @param TARGET2 a vector of country code information.
#' country name (checked against data_countries reference dataset).
#' 
dc_validation_country_countrycode_inconsistent <- function(
  TARGET = NULL,
  TARGET2 = NULL
) {
  result1 <- TARGET %>%
    trimws() %>% 
    tolower()
  result2 <- TARGET2 %>%
    trimws() %>% 
    tolower()
  cn <- tolower(data_countries$country_name)
  cc <- tolower(data_countries$country_code)

  res1 <- sapply(result1, function(x) which(cn == x))
  res2 <- sapply(result2, function(x) which(cc == x))
  
  result <- as.numeric(res1) == as.numeric(res2)
  foo <- perform_dc_missing(result, TARGET)
  bar <- perform_dc_missing(result, TARGET2)

  return(foo + bar == 2)
}