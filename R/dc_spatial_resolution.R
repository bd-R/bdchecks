#' @rdname dc_spatial_resolution
#' 
#' @param input a vector of coordinate uncertainty in meters. To pass it must
#' be lower than inputted resolution.
#' @param resolution a numeric value for the highest coordinate uncertainty
#' required.
#' 
dc_spatial_resolution <- function(
    input = NULL, 
    resolution = 1000
) {
  # Supressing warnings if missing value is being turned into a numeric
  suppressWarnings(
    clean_input <- as.numeric(input)
  )
    resolution <- as.numeric(resolution)
    if (resolution > 0) {
        result <- clean_input <= resolution
    }
    return(perform_dc_missing(result, input))
}
