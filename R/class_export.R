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
  path_yaml = system.file("extdata/data_check.yaml", package = "bdchecks"),
  path_rd = "./R/",
  id_rd = "documentation_"
) {
  #!
  path_yaml <- "inst/extdata/data_check.yaml"
  data_yaml <- yaml::yaml.load_file(path_yaml)
  data_class <- list()
  for (i in seq_along(data_yaml)) {
    writeLines(
      roxygen_comment_generate(data_yaml[[i]]),
      paste0(path_rd, id_rd, data_yaml[[i]]$name, ".R")
    )
    data_class[[i]] <- methods::new(
      "DataCheck",
      name = data_yaml[[i]]$name,
      input = data_yaml[[i]]$input,
      output = data_yaml[[i]]$output,
      information = data_yaml[[i]]$meta$information,
      example = data_yaml[[i]]$meta$example,
      source = data_yaml[[i]]$meta$source,
      pseudocode = data_yaml[[i]]$meta$pseudocode
    )
  }
  names(data_class) <- sapply(data_class, "slot", "name")
  result <- methods::new("DataCheckSet", dc_body = data_class)
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
    "#' @importFrom magrittr %>%",
    "#' @export"
  )

  # Add short description
  skeleton <- sub(
    "shortDesc",
    paste("#' Data check", DC$name, DC$meta$information$description),
    skeleton
  )

  # Add long description
  skeleton <- sub(
    "longDesc", paste0(
      "#'     This data check answers: \"", DC$meta$information$question,
      "\" question.",
      "\\\\cr Data check will pass if \\\\strong{",
      DC$meta$example$pass, "}",
      " and will fail if \\\\strong{",
      DC$meta$example$fail, "}.",
      "\\\\cr Dimension of this data check is \\\\strong{",
      DC$meta$dimension, "}",
      " and it's flagging type is: \\\\strong{FLAG}",
      "\\\\cr Example of entries that will pass: \\\\code{",
      DC$meta$example$input_pass, "},",
      " such data check would return \\\\code{",
      DC$meta$example$output_pass, "}.",
      "\\\\cr Example of entries that will fail: \\\\code{",
      DC$meta$example$input_fail, "},",
      " such data check would return \\\\code{",
      DC$meta$example$output_fail, "}."
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
    ifelse(!is.null(DC$meta$information$keywords),
      paste("#' @keywords", DC$meta$information$keywords),
      ""
    )
  )

  skeleton <- sub("FIELDPASS", DC$meta$example$pass, skeleton)
  skeleton <- sub("FIELDFAIL", DC$meta$example$fail, skeleton)
  skeleton <- sub("FIELDTARGET", DC$input$target, skeleton)
  skeleton <- sub(
    "FIELDCATERGORY",
    DC$meta$information$darwin_core_class,
    skeleton
  )

  body <- c("#'", skeleton, "NULL")
  return(body)
}