#' @rdname dc__decimallongitude_present
#' 
#' @param TARGET a vector of decimallongitude information. To pass it must be
#' non-empty entry. 
#' 
dc__decimallongitude_present <- function(TARGET = NULL) {
  result <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- !is.na(result) & result != "" # Check if not empty
  return(result)
}