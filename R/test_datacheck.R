#' Create a dataset to test datachecks
#'
#' Loads, parses and outputs datasets to test data checks
#' 
#' @param path_datatest String that specifies path to test data in yaml format
#'
#' @return A list of data.frames that contain target column, test type and
#' expected result 
#' 
#' @importFrom magrittr "%>%"
#' @importFrom yaml read_yaml
#'
create_testdata <- function(
  path_datatest = system.file("extdata/data_test.yaml", package = "bdchecks")
) { 
  d <- yaml::read_yaml(path_datatest)
  data_test <- list()
  for (i in seq_along(d)) {
    data_current <- d[[i]]$data
    stopifnot(!is.null(data_current))
    stopifnot(all(c("type", "expected") %in% data_current[[1]]))
    data_test[[i]] <- do.call(rbind, lapply(data_current[-1], as.character)) %>%
      data.frame(stringsAsFactors = FALSE)
    colnames(data_test[[i]]) <- data_current[[1]]
  }
  names(data_test) <- names(d)
  return(data_test)
}

#' Perform tests datachecks
#' 
#' Performs tests for datachecks and creates report
#'
#' @param report A logical value indicating if html report should be rendered
#'
#' @importFrom magrittr %>%
#' @importFrom knitr kable
#' @importFrom kableExtra kable_styling row_spec
#' @importFrom rmarkdown render
#' 
#' @examples
#' data_test <- perform_test_dc()
#' 
#' @export
#'
perform_test_dc <- function(report = FALSE) {
  data_test <- create_testdata()
  for (i in seq_along(data_test)) {
    check <- names(data_test)[i]
    if (!is.null(data.checks@dc_body[[check]]@input$target2)) {
      result_test <- get(paste0("dc_", check))(
        data_test[[i]][, 1],
        data_test[[i]][,  data.checks@dc_body[[check]]@input$target2]
      )
    } else {
      result_test <- get(paste0("dc_", check))(data_test[[i]][, 1])
    }
    data_test[[i]]$observed <- ifelse(
      (is.na(result_test) | result_test == FALSE),
      "fail", "pass"
    )
  }
  if (report) {
    try(rmarkdown::render(
        system.file("rmd/tests.Rmd", package = "bdchecks"),
        quiet = TRUE,
        output_dir = tempdir()
    ))
  }
  return(data_test)
}
