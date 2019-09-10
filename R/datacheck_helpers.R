#' Return available taxonomical records
#'
#' `tax_available_name()` is a function that checks if given records are within
#' specified rank. It requires two inputs `name` of taxonimal records and
#' `rank_orig` (taxonimical rank). Output is subset of names that were within
#' given rank.
#'
#' @param name A character vector of taxonomical records (e.g.
#' `c("Animalia", "Aves")`).
#' @param rank_orig A string for taxonimical rank (e.g. `class`)
#' @param db A string for reference database (passed to `tax_available_name`)
#'
#' @return A character vector of available names within given rank.
#'
#' @importFrom magrittr "%>%"
#' @importFrom taxize classification
#'
#' @examples
#' my_name <- c("Animalia", "Chordata", "Aves", "Mammalia")
#' my_rank <- "class"
#' tax_available_name(my_name, my_rank)
#' 
tax_available_name <- function(name = NULL, rank_orig = "class", db = "gbif") {
  data <- name %>%
    # This is a must modification as the ONLY accepted format is
    # First letter is capitalized and all the rest are lower
    tolower() %>% 
    sub("(^[[:alpha:]])", "\\U\\1", ., perl = TRUE) %>%
    unique() %>%
    na.omit()
  data <- data[data != ""]
  # Need this to suppress querying message
  suppressMessages(capture.output(
    res <- taxize::classification(data, db, ask = FALSE) %>%
      rbind()
  ))
  res <- res[res$rank == rank_orig, "name"] %>%
    unique()
  return(res)
}