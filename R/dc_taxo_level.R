#' @rdname dc_taxo_level
#' 
#' @param input a vector of taxon rank. To pass must be within given
#' dictionary.
#' @param provided_input The low rank of species required.
#' @param ranks A list of taxon ranks that could be chosen.
#' 
dc_taxo_level <- function(
  input = NULL,
  provided_input = "species",
  ranks = c(
    "class",
    "order",
    "family",
    "genus",
    "species",
    "subspecies"
  )
) {
  # tdwg_standard check
  passed <- get(paste0("dc_", "taxonrank_standard"))(input)
  provided_input <- tolower(provided_input)  
  clean_input <- input %>%
    tolower() %>%
    gsub(" ", "", .) # Remove possible spaces

  if (!(provided_input %in% ranks)) {
    stop(
      "Rank Value unknown. It should be family, genus, species or subspecies"
    )
  }   
  idx <- which(ranks == provided_input)
  result <- clean_input[passed] %in% ranks[idx:length(ranks)]
  return(perform_dc_missing(result, input))
}
