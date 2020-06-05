#' @rdname dc_minelevation_inrange
#' 
#' @param TARGET a vector of minimum elevation meters. To pass it must
#' be within lower and upper limits.
#' @param lower_limit a numeric value for a lower limit.
#' @param upper_limit a numeric value for an upper limit.
#' 
dc_minelevation_inrange <- function(
  TARGET = NULL,
  lower_limit = -428,
  upper_limit = 8850
) {
  # Supressing warnings if missing value is being turned into a numeric
  suppressWarnings(
    result <- as.numeric(TARGET)
  )
  result <- lower_limit <= result & result <= upper_limit
  return(perform_dc_missing(result, TARGET))
}