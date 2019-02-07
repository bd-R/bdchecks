#' Export data checks as R objects
#'
#' `exportDC()` is a function for exporting data checks from YAML file to
#' rda and/or roxygen2 file.
#'
#' @param pathYAML  Path to a YAML file.
#' @param exportRDA Should function export data check to a .rda file.
#' @param exportROX Should function create a documentation in .R for roxygen2.
#' @param pathRDA   Path for .rda file.
#' @param pathROX   Path for .R (roxygen2) file.
#' @param idRDA     ID in the beginning of file for .rda file
#' @param idROX     ID in the beginning of file for .R file 
#'                  (helps to differentiate other functions from data checks).
#' 
#' @importFrom yaml yaml.load_file
#' 
exportDC <- function(pathYAML  = "./inst/extdata/dataChecks.yaml", 
                     exportRDA = TRUE,
                     exportROX = TRUE,
                     pathRDA   = "./data/",
                     pathROX   = "./R/",
                     idRDA     = "DC_",  
                     idROX     = "DC_") {

    # Load YAML file with data checks
    DCyaml <- yaml::yaml.load_file(pathYAML)

    # Transform DC from YAML to DC class in R
    # Using loop and assign as base::save wants exact object name
    # !!! TEST FOR BAD YAML
    for(x in DCyaml) {
        if (exportRDA) {
            # Create DC object as save according to DC name
            DC <- createDCclassMain(x)
            assign(paste0(idROX, x$name), DC)
            # Save DC object as rda
            save(list = paste0(idROX, x$name), 
                 file = paste0(pathRDA, idRDA, x$name, ".rda"))
        }
        if (exportROX) {
            writeLines(generateRoxygenComment(DC), 
                       paste0(pathROX, idROX, x$name, ".R"))
        }
    }
    invisible()
}

#' Generate roxygen2 documentation from data check object
#'
#' `generateRoxygenComment()` is a function for generating roxygen2 comments for 
#' a given data check. It's not super flexible as it just inserts metadata into
#' a hard coded skeleton.
#'
#' @param DC Data check to generate documentation for.
#' 
#' @return Data check description in a roxygen2 comment style
#' 
#' @export
#' 
generateRoxygenComment <- function(DC) {

    # Skeleton for documentation
    skeleton <- c(
        "shortDesc",
        "#'",
        "longDesc",
        "#' @name",
        "#' @docType data",
        "#' @format An object of class \\code{\"dataCheck\"}, see \\code{\\link{dataCheck}} for details.",
        "#' @references None",
        "#' @examples \n#' performDC(DC = EXAMPLE@name, DATA = bdchecks::dataBats)",
        "#' @section samplePassData:\n#' FIELDPASS",
        "#' @section sampleFailData:\n#' FIELDFAIL",
        "#' @section targetDWCField:\n#' FIELDTARGET",
        "#' @section checkCategory:\n#'  FIELDCATERGORY")

    # Add short description
    skeleton <- sub("shortDesc", 
                    paste("#' Data check", DC@name, DC@meta@description$Main),
                    skeleton)

    # Add long description
    skeleton <- sub("longDesc", paste0(
        "#'     This data check answers: \"", DC@meta@description$InputQuestion, "?\" question.",
        "\\\\cr Data check will pass if \\\\strong{", DC@meta@description$Example$Pass, "}", 
                " and will fail if \\\\strong{",  DC@meta@description$Example$Fail, "}.", 
        "\\\\cr Dimension of this data check is \\\\strong{", DC@meta@flags$Dimension, "}",
                " and it's flagging type is: \\\\strong{FLAG}",
        "\\\\cr Example of entries that will pass: \\\\code{", DC@meta@description$Example$InputPass, "},",
                " such data check would return \\\\code{", DC@meta@description$Example$OutputPass, "}.",
        "\\\\cr Example of entries that will fail: \\\\code{", DC@meta@description$Example$InputFail, "},",
                " such data check would return \\\\code{", DC@meta@description$Example$OutputFail, "}."
        ),
        skeleton)
    # Add additional fiels for the bdclean
    skeleton <- sub("EXAMPLE@name", paste0("DC_", DC@name), skeleton)

    # Add name
    skeleton <- sub("@name", paste("@name", paste0("DC_", DC@name)), skeleton)
    # Add keywords
    skeleton <- c(skeleton, 
                  ifelse(!is.null(DC@meta@description$keywords), 
                         paste("#' @keywords", DC@meta@description$keywords), ""))

    skeleton <- sub("FIELDPASS", DC@meta@description$Example$Pass, skeleton)
    skeleton <- sub("FIELDFAIL", DC@meta@description$Example$Fail, skeleton)
    skeleton <- sub("FIELDTARGET", DC@input$Target, skeleton)
    skeleton <- sub("FIELDCATERGORY", DC@meta@description$DarwinCoreClass, skeleton)

    body <- c("#'", skeleton, "NULL")
    return(body)
}