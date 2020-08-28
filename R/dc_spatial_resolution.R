#' @rdname dc_spatial_resolution
#' 
#' @param input a vector of coordinate uncertainty in meters. To pass it must
#' be lower than provided resolution.
#' @param spatial_res a numeric value for the highest coordinate uncertainty
#' required.
#' @param ... to allow other input-based to run simultaneously.
#' 
dc_spatial_resolution <- function(
    input = NULL, 
    spatial_res = 1000,
    ...
) {
  # tdwg_standard check
  passed <- get(paste0("dc_", "coordinateuncertainty_inrange"))(input)

  # Supressing warnings if missing value is being turned into a numeric
  suppressWarnings(
    clean_input <- as.numeric(input)
  )
    spatial_res <- as.numeric(spatial_res)
    if (spatial_res > 0) {
        result <- clean_input[passed] <= spatial_res
    }
    return(perform_dc_missing(result, input))
}
