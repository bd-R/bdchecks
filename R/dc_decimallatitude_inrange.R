#' @rdname dc_decimallatitude_inrange
#' 
#' @param TARGET a vector of latitude information. To pass it must
#' be within -90 and 90 degrees.
#' 
dc_decimallatitude_inrange <- function(TARGET = NULL) {
  # Supressing warnings if missing value is being turned into a numeric
  suppressWarnings(
    result <- as.numeric(TARGET)
  )
  result <- -90 <= result & result <= 90
  return(perform_dc_missing(result, TARGET))
}