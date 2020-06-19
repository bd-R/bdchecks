#' @rdname dc_taxo_level
#' 
#' @param input a vector of taxon rank. To pass must be within given
#' dictionary.
#' @param resolution The low rank of species required
#' 
dc_taxo_level <- function(
  input = NULL,
  resolution = "species"
) {
  # change to get_taxon_rank() from dc_taxonrank_standard.R
  ranks <- c(
    "class",
    "order",
    "family",
    "genus",
    "species",
    "subspecies"
  )
  resolution <- tolower(resolution)  
  clean_input <- input %>%
    tolower() %>%
    gsub(" ", "", .) # Remove possible spaces

  if (!(resolution %in% ranks)) {
      warning("Rank Value unknown. It should be family, genus, species or subspecies")
  }   
  idx <- which(ranks == resolution)
  result <- clean_input %in% ranks[idx:length(ranks)]
  return(perform_dc_missing(result, input))
}