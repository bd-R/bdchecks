#' @rdname dc_notification_datageneralizations_notempty
#' 
#' @param TARGET a vector of data generalization information. 
#' 
dc_notification_datageneralizations_notempty <- function(TARGET = NULL) {
  result <- TARGET %>%
    gsub(" ", "", .) # Remove possible spaces
  result <- !is.na(result) & result != "" # Check if not empty
  return(result)
}