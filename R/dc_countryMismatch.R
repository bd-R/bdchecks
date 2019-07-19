#' @rdname dc_countryMismatch
#' @param TARGET1 first vector of country names
#' @param TARGET2 second vector of country names
#' @param DEPEND1 first vector of country codes
#' @param DEPEND2 second vector of country codes
#' 
dc_countryMismatch <- function(TARGET1, TARGET2, DEPEND1, DEPEND2) {
  result <- sapply(seq_along(TARGET1), function(i) {
    if (is.na(TARGET1[i]) | is.na(TARGET2[i])) {
      NA
    } else {
      foo <- which(DEPEND1 == TARGET1[i])
      bar <- which(DEPEND2 == TARGET2[i])
      if (length(foo) == 0 | length(bar) == 0) {
        NA
      } else {
        foo == bar
      }
    }
  })
  result <- unlist(result)
  return(result)
}