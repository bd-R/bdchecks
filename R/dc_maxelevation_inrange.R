#' @rdname dc_maxelevation_inrange
#' 
#' @param input a vector of maximum elevation meters. To pass it must
#' be within lower and upper limits.
#' @param lower_limit a numeric value for a lower limit.
#' @param upper_limit a numeric value for an upper limit.
#' 
dc_maxelevation_inrange <- function(
  input = NULL,
  lower_limit = -428,
  upper_limit = 8850
) {
  # Supressing warnings if missing value is being turned into a numeric
  suppressWarnings(
    clean_input <- as.numeric(input)
  )
  result <- lower_limit <= clean_input & clean_input <= upper_limit
  return(perform_dc_missing(result, input))
}
