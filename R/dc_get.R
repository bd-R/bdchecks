#' Load Data Checks
#'
#' `dc_get()` is a function for importing data checks from a YAML file as
#' a dataCheck object.
#'
#' @param path_yaml Path to a YAML file.
#'
#' @return A list of data checks
#'
#' @importFrom yaml yaml.load_file
#'
#' @export
#'
dc_get <- function(path_yaml = "../inst/extdata/dataChecks.yaml") {
  # Load YAML file with data checks
  DCyaml <- yaml::yaml.load_file(path_yaml)
  DC <- list()
  # For each entry create data check object
  for (x in DCyaml) {
    DC[[paste0("DC_", x$name)]] <- dc_main_create(x)
  }
  return(DC)
}