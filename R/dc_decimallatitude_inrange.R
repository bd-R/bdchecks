#' @rdname dc_decimallatitude_inrange
#' 
#' @param input a vector of latitude information. To pass it must
#' be within -90 and 90 degrees.
#' 
dc_decimallatitude_inrange <- function(input = NULL) {
  # Supressing warnings if missing value is being turned into a numeric
  suppressWarnings(
    clean_input <- as.numeric(input)
  )
  result <- -90 <= clean_input & clean_input <= 90
  return(perform_dc_missing(result, input))
}
