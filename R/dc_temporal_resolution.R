#' @rdname dc_temporal_resolution
#' 
#' @param input a vector of event date information. To pass must be within 
#'  provided range and resolution.
#' @param temporal_res a range of dates and required temporal resolution.
#' 
#' @importFrom magrittr "%<>%"
#' 
dc_temporal_resolution <- function(
    input = NULL, 
    temporal_res = c("2016-01-02", "2018-02-08", "month")
) {
  res <- strsplit(temporal_res, " ")[[3]] %>%
    tolower()
  if (!(res %in% c("day", "month", "year"))) {
    stop("Temporal Value unknown. It should be day, month or year")
  }
  #check if input not na, null
  # tdwg_standard check
  passed <- get(paste0("dc_", "eventdate_inrange"))(input)
  # input cleaning
  clean_input <- input %>%
    gsub(" ", "", .) # Remove possible spaces
  clean_input <- ifelse(clean_input == "", NA, clean_input) %>%
    as.Date(origin = "1970-01-01")
  # temporal resolution
  start_date <- strsplit(temporal_res, " ")[[1]] %>%
    as.Date(origin = "1970-01-01")
  end_date <- strsplit(temporal_res, " ")[[2]] %>%
    as.Date(origin = "1970-01-01")   
  if (res == "day") {
    result <- (
      clean_input[passed] >= start_date &
      clean_input[passed] <= end_date
    )
  } else if (res %in% c("month", "year")) {
    start_date %<>% 
      lubridate::ymd() %>%
      lubridate::floor_date(res)
    end_date %<>% 
      lubridate::ymd() %>%
      lubridate::ceiling_date(res)
    result <- (
      clean_input[passed] >= start_date &
      clean_input[passed] < end_date
    )
  }
  return(perform_dc_missing(result, input))
}
