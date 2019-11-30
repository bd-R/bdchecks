#' @rdname dc_validation_coordinateuncertainty_outofrange
#' 
#' @param TARGET a vector of coordinate uncertainty in meters. To pass it must
#' be betwee lower and upper limit.
#' @param lower_limit a numeric value for a lower limit.
#' @param upper_limit a numeric value for an upper limit.
#' 
dc_validation_coordinateuncertainty_outofrange <- function(
  TARGET = NULL,
  lower_limit = 1,
  upper_limit = 20037509
) {
  # Supressing warnings if missing value is being turned into a numeric
  suppressWarnings(
    result <- as.numeric(TARGET)
  )
  result <- lower_limit <= result & result <= upper_limit
  return(perform_dc_missing(result, TARGET))
}