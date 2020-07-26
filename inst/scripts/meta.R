#clean_input <- clean(input, meta@type)

check_clean <- function(input, type) {
  if (type == "numeric") {
    class_numeric(input)
    clean_numeric(input)
  } else if (type == "character") {
    clean_character(input)
  } else (type == "date") {
    class_date(input)
    clean_date(input)
  }
}
# class_ functions check whether input class is correct
class_numeric <- function(input) {
  expected <- is.na(input)
  observed <- suppressWarnings(
    input %>%
      as.numeric() %>%
      is.na()
  )
  # in progress
}
#input <- c(NA, "2017-02-02", "asd", "1")
class_date <- function(input) {
  expected <- is.na(input)
  observed <- suppressWarnings(
    input %>%
      lubridate::as_date() %>%
      is.na()
  )
  # in progress
}
clean_numeric <- function(input) {
  suppressWarnings(
    input %>%
      gsub(" ", "", .) %>%
      as.numeric()
  )
}
clean_character <- function(input) {
  input %>%
    trimws() %>%
    gsub(" ", "", .)
}
clean_date <- function(input) {
  input %>%
    as.Date() %>%
    as.POSIXct()
}
