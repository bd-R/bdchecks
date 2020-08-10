#' Create a dataset to test datachecks
#'
#' Loads, parses and outputs datasets to test data checks
#' 
#' @param path_datatest String that specifies path to test data in yaml format
#' @param wanted_dc Character vector of names for data checks that should be 
#' tested (i.e. test only these data checks)
#'
#' @return A list of data.frames that contain target column, test type and
#' expected result 
#' 
#' @importFrom magrittr "%>%"
#' @importFrom yaml read_yaml
#'
create_testdata <- function(
  path_datatest = system.file("extdata/data_test.yaml", package = "bdchecks"),
  wanted_dc = NULL
) {
  if (is.null(wanted_dc)) {
    wanted_dc <- names(data.checks@dc_body)
  } 
  d <- yaml::read_yaml(path_datatest)
  data_test <- list()
  for (i in seq_along(wanted_dc)) {
    idx <- which(names(d) == wanted_dc[i])
    stopifnot(length(idx) == 1)
    data_current <- d[[idx]]$data
    stopifnot(!is.null(data_current))
    stopifnot(all(c("type", "expected") %in% data_current[[1]]))
    data_test[[i]] <- do.call(
      rbind, lapply(data_current[-1], as.character)
    ) %>%
      data.frame(stringsAsFactors = FALSE)
    colnames(data_test[[i]]) <- data_current[[1]]
  }
  names(data_test) <- wanted_dc
  return(data_test)
}

#' Perform tests datachecks
#' 
#' Performs tests for datachecks and creates report
#'
#' @param report A logical value indicating if html report should be rendered
#' @param wanted_dc Character vector of names for data checks that should be 
#' tested (i.e. test only these data checks)
#' @param summary A logical value indicating if the summary should be 
#' outputted instead of the full list of tests
#'
#' @importFrom magrittr "%>%"
#' @importFrom knitr kable
#' @importFrom kableExtra kable_styling row_spec
#' @importFrom rmarkdown render
#' 
#' @examples
#' data_test <- perform_test_dc()
#' 
#' @export
#'
perform_test_dc <- function(
  report = FALSE, 
  wanted_dc = NULL,
  summary = FALSE
) {
  data_test <- create_testdata(wanted_dc = wanted_dc)
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
  if (summary) {
    bar <- c()
    failed_cases <- list()
    for (i in seq_along(data_test)) {
      d <- data_test[[i]]
      bar <- c(bar, any(d$expected != d$observed))
      if (any(d$expected != d$observed)) {
        failed_cases <- list(failed_cases, d)
      }
    }
    if (length(failed_cases) == 0) {
      failed_cases <- "No failed cases. All expected and observed values match"
    }
    test_summary <- data.frame(
      Total = length(data_test),
      Passed = sum(!bar),
      Failed = sum(bar)
    )
    return(list(Summary = test_summary, Failed = failed_cases))
  } else {
    return(data_test)  
  }
}
