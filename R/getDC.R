#' Load Data Checks
#'
#' `getDC()` is a function for importing data checks from a YAML file as 
#' a dataCheck object.
#' 
#' @param pathYAML Path to a YAML file.
#'
#' @return A list of data checks
#' 
#' @importFrom yaml yaml.load_file
#' 
#' @export
#' 
getDC <- function(pathYAML = "../inst/extdata/dataChecks.yaml") {
    # Load YAML file with data checks
    DCyaml <- yaml::yaml.load_file(pathYAML)
    DC <- list()
    # For each entry create data check object
    for(x in DCyaml) {
        DC[[paste0("DC_", x$name)]] <- createDCclassMain(x)
    }
    return(DC)
}