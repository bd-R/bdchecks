#' @rdname dc_decimallongitude_inrange
#' 
#' @param input a vector of longitude information. To pass it must
#' be within -180 and 180 degrees.
#' 
dc_decimallongitude_inrange <- function(input = NULL) {
  # Supressing warnings if missing value is being turned into a numeric
  suppressWarnings(
    clean_input <- as.numeric(input)
  )
  result <- -180 <= clean_input & clean_input <= 180
  return(perform_dc_missing(result, input))
}
