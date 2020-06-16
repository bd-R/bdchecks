#' @rdname dc_coordinates_notzero
#' 
#' @param input a vector of decimalLatitude or decimalLongitude information.
#' To pass it must not be equal to zero.
#' 
dc_coordinates_notzero <- function(input = NULL) {
  # Supressing warnings if missing value is being turned into a numeric
  suppressWarnings(
    result <- as.numeric(input) != 0
  )
  return(perform_dc_missing(result, input))
}
