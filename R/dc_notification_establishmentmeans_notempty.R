#' @rdname dc_notification_establishmentmeans_notempty
#' 
#' @param TARGET a vector of establishment means information. 
#' 
dc_notification_establishmentmeans_notempty <- function(TARGET = NULL) {
  result <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- !is.na(result) & result != "" # Check if not empty
  return(result)
}