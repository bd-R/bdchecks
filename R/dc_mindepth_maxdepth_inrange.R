#' @rdname dc_mindepth_maxdepth_inrange
#' 
#' @param input a vector of minimum or maximum depth in meters. To pass it must
#' be within lower and upper depth parameters.
#' @param lower_depth a numeric value for a lower depth.
#' @param upper_depth a numeric value for an upper depth.
#' 
dc_mindepth_maxdepth_inrange <- function(
  input = NULL,
  lower_depth = 0,
  upper_depth = 11000
) {
  # Supressing warnings if missing value is being turned into a numeric
  suppressWarnings(
    clean_input <- as.numeric(input)
  )
  result <- lower_depth <= clean_input & clean_input <= upper_depth
  return(perform_dc_missing(result, input))
}
