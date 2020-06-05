#' @rdname dc_eventtemporal_present
#' 
#' @param TARGET a vector of event temporal information. To pass it must be
#' non-empty entry. 
#' 
dc_eventtemporal_present <- function(TARGET = NULL) {
  result <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- !is.na(result) & result != "" # Check if not empty
  return(result)
}