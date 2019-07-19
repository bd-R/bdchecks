#' Export data checks as R objects
#'
#' `dc_export()` is a function for exporting data checks from YAML file to
#' rda and/or roxygen2 file.
#'
#' @param path_yaml  Path to a YAML file.
#' @param path_rd   Path for .R (roxygen2) file.
#' @param id_rd     ID in the beginning of file for .R file
#'                  (helps to differentiate other functions from data checks).
#'
#' @importFrom yaml yaml.load_file
#'
datacheck_info_export <- function(
  path_yaml = "./inst/extdata/dataChecks.yaml",
  path_rd = "./R/",
  id_rd = "documentation_"
) {

  DCyaml <- yaml::yaml.load_file(path_yaml)
  DCclass <- list()
  for (i in seq_along(DCyaml)) {
    writeLines(
      roxygen_comment_generate(DCyaml[[i]]),
      paste0(path_rd, id_rd, DCyaml[[i]]$name, ".R")
    )
    DCclass[[i]] <- methods::new(
      "DataCheck",
      name = DCyaml[[i]]$name,
      input = DCyaml[[i]]$Input,
      description = DCyaml[[i]]$meta$Description,
      flags = DCyaml[[i]]$meta$Flags,
      source = DCyaml[[i]]$meta$Source,
      pseudocode = DCyaml[[i]]$meta$Pseudocode
    )
  }
  names(DCclass) <- sapply(DCclass, "slot", "name")
  result <- methods::new("DataCheckSet", dc_body = DCclass)
  return(result)
}

#' Generate roxygen2 documentation from data check object
#'
#' `roxygen_comment_generate()` is a function for generating roxygen2
#' comments for a given data check. It's not super flexible as it just
#' inserts metadata into a hard coded skeleton.
#'
#' @param DC Data check to generate documentation for.
#'
#' @return Data check description in a roxygen2 comment style
#'
roxygen_comment_generate <- function(DC) {

  # Skeleton for documentation
  skeleton <- c(
    "shortDesc",
    "#'",
    "longDesc",
    "#' @name",
    "#' @format An object of class function to perform a specific data check.",
    "#' @references None",
    "#' @examples \n#' perform_dc(data_bats, 'EXAMPLE@name')",
    "#' @section samplePassData:\n#' FIELDPASS",
    "#' @section sampleFailData:\n#' FIELDFAIL",
    "#' @section targetDWCField:\n#' FIELDTARGET",
    "#' @section checkCategory:\n#'  FIELDCATERGORY",
    "#' @export"
  )

  # Add short description
  skeleton <- sub(
    "shortDesc",
    paste("#' Data check", DC$name, DC$meta$description$Main),
    skeleton
  )

  # Add long description
  skeleton <- sub(
    "longDesc", paste0(
      "#'     This data check answers: \"", DC$meta$description$InputQuestion,
      "?\" question.",
      "\\\\cr Data check will pass if \\\\strong{",
      DC$meta$description$Example$Pass, "}",
      " and will fail if \\\\strong{",
      DC$meta$description$Example$Fail, "}.",
      "\\\\cr Dimension of this data check is \\\\strong{",
      DC$meta$flags$Dimension, "}",
      " and it's flagging type is: \\\\strong{FLAG}",
      "\\\\cr Example of entries that will pass: \\\\code{",
      DC$meta$description$Example$InputPass, "},",
      " such data check would return \\\\code{",
      DC$meta$description$Example$OutputPass, "}.",
      "\\\\cr Example of entries that will fail: \\\\code{",
      DC$meta$description$Example$InputFail, "},",
      " such data check would return \\\\code{",
      DC$meta$description$Example$OutputFail, "}."
    ),
    skeleton
  )
  # Add additional fiels for the bdclean
  skeleton <- sub("EXAMPLE@name", DC$name, skeleton)

  # Add name
  skeleton <- sub("@name", paste("@name", paste0("dc_", DC$name)), skeleton)
  # Add keywords
  skeleton <- c(
    skeleton,
    ifelse(!is.null(DC$meta$description$keywords),
      paste("#' @keywords", DC$meta$description$keywords),
      ""
    )
  )

  skeleton <- sub("FIELDPASS", DC$meta$Description$Example$Pass, skeleton)
  skeleton <- sub("FIELDFAIL", DC$meta$Description$Example$Fail, skeleton)
  skeleton <- sub("FIELDTARGET", DC$Input$Target, skeleton)
  skeleton <- sub(
    "FIELDCATERGORY",
    DC$meta$Description$DarwinCoreClass,
    skeleton
  )

  body <- c("#'", skeleton, "NULL")
  return(body)
}