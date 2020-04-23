#' @rdname dc_geodeticdatum_present
#' 
#' @param TARGET a vector of geodeticDatum information. To pass it must be
#' non-empty entry. 
#' 
dc_geodeticdatum_present <- function(TARGET = NULL) {
  result <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- !is.na(result) & result != "" # Check if not empty
  return(result)
}