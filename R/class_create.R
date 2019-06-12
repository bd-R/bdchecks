#' Create a data check object
#'
#' Create a data check object from a given YAML file
#'
#' @param yaml Data check entry as a list (originally imported as a
#' YAML file)
#'
#' @importFrom methods new
#'
#' @return Data check object
#'
#' @export
#'
dc_main_create <- function(yaml) {
  res <- methods::new("dataCheck",
    name = yaml$name,
    meta = dc_meta_create(yaml$meta),
    input = yaml$Input,
    func = parse(text = yaml$Functionality)
  )
  return(res)
}

#' Create a data check metadata object
#'
#' Create a data check metadata object from a given slot in a data check list
#' object
#'
#' @param meta Data check metadata entry as a list.
#'
#' @importFrom methods new
#'
#' @return Data check metadata object
#'
dc_meta_create <- function(meta) {
  res <- methods::new("dataCheckMeta",
    description = meta$Description,
    flags = meta$Flags,
    pseudocode = meta$Pseudocode,
    source = meta$Source
  )
  return(res)
}