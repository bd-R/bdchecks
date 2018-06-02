#' Load data checks
#'
#' `getDC()` is a function for importing data checks from YAML file as 
#' a dataCheck object.
#'
#' @param pathYAML Path to a YAML file.
#'
#' @export
#' 
#' @examples
#' dataChecks <- getDC(pathYAML = "pathToYAML.yaml")
#' 
getDC <- function(pathYAML = "./DC_test.yaml") {
    # Load YAML file with data checks
    DCyaml <- yaml::yaml.load_file(pathYAML)
    DC <- list()
    for(x in DCyaml) {
        DC[[paste0("DC_", x$name)]] <- createDCclassMain(x)
    }
    return(DC)
}