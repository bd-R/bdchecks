#' @rdname dc_taxo_level
#' 
#' @param input a vector of taxon rank. To pass must be within given
#' dictionary.
#' @param lowest_rank The lowest rank of species required.
#' @param ranks A list of taxon ranks that could be chosen.
#' @param ... to allow other input-based to run simultaneously.
#' 
dc_taxo_level <- function(
  input = NULL,
  lowest_rank = "species",
  ranks = c(
    "class",
    "order",
    "family",
    "genus",
    "species",
    "subspecies"
  ),
  ...
) {
  # tdwg_standard check
  passed <- get(paste0("dc_", "taxonrank_standard"))(input)
  lowest_rank <- tolower(lowest_rank)  
  clean_input <- input %>%
    tolower() %>%
    gsub(" ", "", .) # Remove possible spaces

  if (!(lowest_rank %in% ranks)) {
    stop(
      "Rank Value unknown. It should be family, genus, species or subspecies"
    )
  }   
  idx <- which(ranks == lowest_rank)
  result <- clean_input[passed] %in% ranks[idx:length(ranks)]
  return(perform_dc_missing(result, input))
}
