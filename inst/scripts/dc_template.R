#' @rdname (check name)
#' 
#' @param input (describe input and how the check is passed)
#' 

# input info and check name could be from metadata info
dc_(check name) <- function(input = NULL) {
  # cleaning based on metadata info
  clean_input <- clean(input, meta@type)

  result <- dc_check(clean_input) # or check-specific code
  return(perform_dc_missing(result, input))
}