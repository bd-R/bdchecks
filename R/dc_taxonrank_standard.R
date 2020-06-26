#' @rdname dc_taxonrank_standard
#' 
#' @param input a vector of taxon rank. To pass must be within given
#' dictionary.
#' @param language language for terms (default is English 'en', but usage of
#' all 'all' is also possible). 
#' @param alternative logical value - should alternative terms be used too.
#' 
dc_taxonrank_standard <- function(
  input = NULL,
  language = "en",
  alternative = FALSE
) {
  clean_input <- input %>%
    tolower() %>%
    gsub(" ", "", .) # Remove possible spaces

  # Prepare reference dictionary
  if (language == "all") {
    data_reference <- data_taxonrank
  } else {
    data_reference <- data_taxonrank[data_taxonrank$term_language == language, ]
  }
  if (nrow(data_reference) == 0) {
    data_reference <- data_taxonrank[data_taxonrank$term_language == "en", ]
    warning(
      "No terms found in specified language. Available languages are: ",
      paste(unique(data_taxonrank$term_language), collapse = ","), ".",
      "Using terms from en language." 
    )
  }
  if (!alternative) {
    data_reference <- data_reference[data_reference$group == "prefered", ]
  }
  # Check if submitted taxon rank is in dictionary
  result <- clean_input %in% tolower(data_reference$term)
  return(perform_dc_missing(result, input))
}
