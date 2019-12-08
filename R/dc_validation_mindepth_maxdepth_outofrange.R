#' @rdname dc_validation_mindepth_maxdepth_outofrange
#' 
#' @param TARGET a vector of minimum or maximum depth in meters. To pass it must
#' be within lower and upper depth parameters.
#' @param lower_depth a numeric value for a lower depth.
#' @param upper_depth a numeric value for an upper depth.
#' 
dc_validation_mindepth_maxdepth_outofrange <- function(
  TARGET = NULL,
  lower_depth = 0,
  upper_depth = 11000
) {
  # Supressing warnings if missing value is being turned into a numeric
  suppressWarnings(
    result <- as.numeric(TARGET)
  )
  result <- lower_depth <= result & result <= upper_depth
  return(perform_dc_missing(result, TARGET))
}