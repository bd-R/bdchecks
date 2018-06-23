#' Create a data check metatadata from a given YAML file
#' 
#' @param DCmeta Data check metadata slot in YAML format
#' 
#' @return Data check metadata object
#' 
createDCclassMeta <- function(DCmeta) {
    res <- new("dataCheckMeta",
               description = DCmeta$Description,
               question    = DCmeta$InputQuestion,
               dimension   = DCmeta$Dimension,
               source      = DCmeta$Source,
               keywords    = DCmeta$Keywords,
               example     = DCmeta$Example,
               pseudocode  = DCmeta$Pseudocode)
    return(res)
}

#' Create a data check object from a given YAML file
#' 
#' @param DCyaml Data check slot in YAML format
#'
#' @return Data check object
#' 
createDCclassMain <- function(DCyaml) {
    res <- new("dataCheck",
               name   = DCyaml$name,
               guid   = DCyaml$guid,
               meta   = createDCclassMeta(DCyaml$meta),
               input  = DCyaml$Input,
               output = DCyaml$Output,
               func   = parse(text = DCyaml$Functionality))
    return(res)
}