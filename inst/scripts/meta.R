#clean_input <- clean(input, meta@type)

clean <- function(input, type) {
  if (type == "numeric") {
    clean_numeric(input)
  } else if (type == "character") {
    clean_character(input)
  } else (type == "date") {
    clean_date(input)
  }
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
# most "_present" "_valid" and "_inrange" checks use same code
dc_check <- function(clean_input, check_type) {
  if (check_type == "present") {
    !is.na(clean_input) & clean_input != ""
  } else if (check_type == "valid") {
    # for taxonomical checks
    dc_valid(clean_input, taxon)
  } else (check_type == "inrange") {
    dc_inrange(clean_input, range)
  }
}