#' @rdname dc_validation_decimallongitude_outofrange
#' 
#' @param TARGET a vector of longitude information. To pass it must
#' be within -180 and 180 degrees.
#' 
dc_validation_decimallongitude_outofrange <- function(TARGET = NULL) {
  # Supressing warnings if missing value is being turned into a numeric
  suppressWarnings(
    result <- as.numeric(TARGET)
  )
  result <- -180 <= result & result <= 180
  return(perform_dc_missing(result, TARGET))
}