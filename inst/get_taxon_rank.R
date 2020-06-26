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
