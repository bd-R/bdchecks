#' @rdname dc_depthOutOfRange
#' 
#' @param TARGET a vector of numeric values for depth. To pass must be between
#' min_dep and max_dep.
#' @param min_dep a numeric value specifying minimum depth.
#' @param max_dep a numeric value specifying maximum depth.
#' 
dc_depthOutOfRange <- function(TARGET, min_dep = 0, max_dep = 11e3) {
  result <- TARGET %>%
    gsub(" ", "", .) %>% # Remove possible spaces
    as.numeric() # Value must be turned numeric
  # Main part - check if value is within range
  result <- result >= min_dep & result <= max_dep 
  return(perform_dc_missing(result, TARGET))
}