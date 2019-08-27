#' @rdname dc_validation_taxonrank_notstandard
#' 
#' @param TARGET a vector of taxon rank. To pass must be within given
#' dictionary.
#' @param language language for terms (default is English 'en', but usage of
#' all 'all' is also possible). 
#' @param alternative logical value - should alternative terms be used too.
#' @param get_gbif_rank logical value - should update gbif dictionary.
#' @param path_rank path to gbif dictionary
#' 
dc_validation_taxonrank_notstandard <- function(
  TARGET = NULL,
  language = "en",
  alternative = FALSE,
  get_gbif_rank = FALSE,
  path_rank = "http://rs.gbif.org/vocabulary/gbif/rank.xml"
) {
  result <- TARGET %>%
    tolower() %>%
    gsub(" ", "", .) # Remove possible spaces

  # Prepare reference dictionary
  if (get_gbif_rank) {
    data_taxonrank <- get_taxon_rank(path_rank)
  }
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
  result <- result %in% tolower(data_reference$term)
  return(perform_dc_missing(result, TARGET))
}


#' Retrieve Information about Taxon Rank
#'
#' `get_taxon_rank()` is a function to download reference dictionary of
#' available taxon ranks.
#'
#' @param path_rank Path to a reference dictionary.
#'
#' @importFrom xml2 read_xml xml_contents
#' @importFrom magrittr %>%
#'
#' @return A data.frame of avaible taxon ranks (prefered and alternative terms)
#' 
get_taxon_rank <- function(
  path_rank = "http://rs.gbif.org/vocabulary/gbif/rank.xml"
) {

  data <- path_rank %>%
    xml2::read_xml(encoding = "UTF-8") %>%
    xml2::xml_contents() %>%
    as.character()

  lapply(data, function(x) {

    identifier <- sub("<concept dc:identifier=.([A-z]+). .*", "\\1", x)
    foo <- sub(".*<preferred>(.*)</preferred>.*", "\\1", x) %>%
      strsplit("term")
    term_prefered <- lapply(foo, function(x) {
      sub('.*dc:title="([[:ascii:]]+)" .*\\n.*', "\\1", x, perl = TRUE)
    })[[1]][-1]
    lang_prefered <- lapply(foo, function(x) {
      sub('.*xml:lang="([a-z]+)"/>.*\n.*', "\\1", x, perl = TRUE)
    })[[1]][-1]

    foo <- sub(".*<alternative>(.*)</alternative>.*", "\\1", x) %>%
      strsplit("term")
    term_altern <- lapply(foo, function(x) {
      sub('.*dc:title="([[:ascii:]]+)" .*\\n.*', "\\1", x, perl = TRUE)
    })[[1]][-1]
    lang_altern <- lapply(foo, function(x) {
      sub('.*xml:lang="([a-z]+)"/>.*\n.*', "\\1", x, perl = TRUE)
    })[[1]][-1]

    d1 <- data.frame(
      identifier,
      term = term_prefered,
      term_language = lang_prefered,
      group = "prefered",
      stringsAsFactors = FALSE
    )
    if (length(term_altern) > 0) {
      d2 <- data.frame(
        identifier,
        term = term_altern,
        term_language = lang_altern,
        group = "alternative",
        stringsAsFactors = FALSE
      )
      rbind(d1, d2)
    } else {
      d1
    }
  }) %>%
    do.call(rbind, .)

}