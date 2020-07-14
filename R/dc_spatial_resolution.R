#' @rdname dc_spatial_resolution
#' 
#' @param input a vector of coordinate uncertainty in meters. To pass it must
#' be lower than provided resolution.
#' @param provided_input a numeric value for the highest coordinate uncertainty
#' required.
#' 
dc_spatial_resolution <- function(
    input = NULL, 
    provided_input = 1000
) {
  # tdwg_standard check
  passed <- get(paste0("dc_", "coordinateuncertainty_inrange"))(input)

  # Supressing warnings if missing value is being turned into a numeric
  suppressWarnings(
    clean_input <- as.numeric(input)
  )
    provided_input <- as.numeric(provided_input)
    if (provided_input > 0) {
        result <- clean_input[passed] <= provided_input
    }
    return(perform_dc_missing(result, input))
}
