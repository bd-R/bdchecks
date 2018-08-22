#' Create a data check object
#' 
#' Create a data check object from a given YAML file
#' 
#' @param DCyaml Data check entry as a list (originally imported as a 
#' YAML file)
#'
#' @importFrom methods new
#' 
#' @return Data check object
#' 
#' @export
#' 
createDCclassMain <- function(DCyaml) {
    res <- methods::new("dataCheck",
               name   = DCyaml$name,
               meta   = createDCclassMeta(DCyaml$meta),
               input  = DCyaml$Input,
               func   = parse(text = DCyaml$Functionality))
    return(res)
}

#' Create a data check metadata object
#' 
#' Create a data check metadata object from a given slot in a data check list 
#' object
#' 
#' @param DCmeta Data check metadata entry as a list.
#' 
#' @importFrom methods new
#' 
#' @return Data check metadata object
#' 
createDCclassMeta <- function(DCmeta) {
    res <- methods::new("dataCheckMeta",
               description = DCmeta$Description,
               flags       = DCmeta$Flags,
               pseudocode  = DCmeta$Pseudocode,
               source      = DCmeta$Source)
    return(res)
}