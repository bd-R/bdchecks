library(bdchecks)

# change only the line below to run tests on different data
testing_data <- bdchecks::data_bats

# Test class export functions
context("Export Function")
# test datacheck_info_export
# exports data checks from YAML file to rda and/or roxygen2 file.
test_that("datacheck_info_export", {
  # check if file exists
  path_yaml <- system.file("extdata/data_check.yaml", package = "bdchecks")
  expect_true(file.exists(path_yaml))
  # check if file is not empty
  data_yaml <- yaml::yaml.load_file(path_yaml)
  expect_true(length(data_yaml) != 0)
  # Check if output is valid
  if (!file.exists("./R")) {
    foo <- dir.create("./foo")
    result <- expect_silent(datacheck_info_export(path_rd = foo)) 
  }
  expect_s4_class(result, "DataCheckSet")
  expect_message(print(result))
})
 
# Test perform functions
context("Data Checks")
# test perform_dc
# performs data checks on a given data set
test_that("perform_dc", {
  # No data set provided will give warnings and null
  result <- expect_error(perform_dc())
  result <- expect_warning(perform_dc(testing_data))
  # we should have at least 18 performed DCs
  expect_gt(length(result@DC), 1)
  # No arguments provided
  expect_warning(perform_dc(testing_data))
  expect_error(perform_dc(mtcars))
  expect_silent(
    perform_dc(testing_data, wanted_dc = "taxo_level", lowest_rank = "family")
  )
  # This will depend on data version
  expect_equal(sum(
    perform_dc(testing_data, "taxonrank_present")@flags[[1]]@result
  ), 1e3)
  expect_message(print(result))
})

# Test data checks
context("Test Data Checks")
test_that("perform_test_dc", {
  result <- expect_silent(perform_test_dc())
  foo <- function(result) {
      res <- list()
      for (i in seq_along(result)) {
        d <- result[[i]]
        res[[i]] <- d[d$expected != d$observed, ]
        colnames(res[[i]])[1] <- "input"
        if (nrow(res[[i]]) > 0) {
          res[[i]] <- data.frame(dc = names(result)[i], res[[i]]) 
          rownames(res[[i]]) <- NULL
        }
      }
      res <- do.call(rbind, res)
      if (nrow(res) > 0) {
        print(
          knitr::kable(res, "rst")
        )
        FALSE
      } else {
        TRUE
      }
    }
  expect_true(foo(result), label = "Tests for data check")
  expect_silent(perform_test_dc(report = TRUE))
  expect_silent(perform_test_dc(summary = TRUE))
})

# Test dc functions
context("Unique dc cases: taxonrank_standard")
# test dc_taxonrank_standard
test_that("dc_taxonrank_standard", {
  foo <- unique(testing_data$taxonRank)
  # We expect warnings as not all columns are present
  bar <- expect_silent(dc_taxonrank_standard(input = foo, language = "all"))
  bar <- expect_warning(dc_taxonrank_standard(input = foo, language = "test"))
})

# Test dc functions
context("Unique dc cases: temporal_resolution")
# test dc_temporal_resolution
test_that("dc_temporal_resolution", {
  foo <- unique(testing_data$eventDate)
  # We expect warnings as not all columns are present
  bar <- expect_silent(
    dc_temporal_resolution(
      input = foo, 
      temporal_res = c("2016-01-02", "2018-02-08", "day")
    )
  )
  bar <- expect_error(
    dc_temporal_resolution(
      input = foo, 
      temporal_res = c("2016-01-02", "2018-02-08", "week")
    )
  )
})

# Test dc functions
context("Unique dc cases: taxo_level")
# test dc_taxo_level
test_that("dc_taxo_level", {
  foo <- unique(testing_data$taxonRank)
  # We expect warnings as not all columns are present
  bar <- expect_error(dc_taxo_level(input = foo, lowest_rank = "test"))
})

# Test summary functions
context("Summary Function")
# test dc_summary
# outputs summary table for passed/failed data checks
test_that("summary_dc", {
  # Data checks on example data
  # We expect warnings as not all columns are present
  result <- expect_warning(perform_dc(testing_data))
  # Check if output is valid
  expect_s4_class(result, "DataCheckFlagSet")
  # If any DataCheckFlagSet@flags@result missing, its not included in summary
  fake_result <- result
  fake_result@flags[[10]]@result <- logical()
  bar <- summary_dc(fake_result, fancy = FALSE, filtering_dt = FALSE)
  expect_false(length(fake_result@flags) == nrow(bar))
  # Summary output 1
  foo <- summary_dc(result, fancy = FALSE, filtering_dt = FALSE)
  expect_s3_class(foo, "data.frame")
  # expect_equal(nrow(foo), 22)
  expect_equal(ncol(foo), 5)
  foo <- summary_dc(result, fancy = FALSE, filtering_dt = TRUE)
  expect_s3_class(foo, "data.frame")
  expect_match(colnames(foo)[3:5], "%")
  # Summary output 2
  foo <- summary_dc(result)
  expect_s3_class(foo, "knitr_kable")
})

# Test filter generating functions
context("Filter generating function")
# test dc_filter_generate
# generates vector for filtering data checks result table
# according to `selectCells` object.
test_that("dc_filter_generate", {
  # Data checks on example data
  # We expect warnings as not all columns are present
  dc <- names(data.checks@dc_body[c(1:3)])
  result <- expect_warning(perform_dc(testing_data, wanted_dc = dc))
  foo <- summary_dc(result, fancy = FALSE, filtering_dt = TRUE)
  # will be used for 'cell_selected' option, usually generated in shiny app
  # 1st column row number in the summary table, 2nd column - specific value:
  # '2' for passed, '3' for failed, '4' for missing
  filter_matrix <- matrix(c(seq(foo[,1]), 2, 3, 4), nrow = 3)
  # generating filters
  bar <- expect_silent(
    dc_filter_generate(
      dc_result_summary = foo, 
      cell_selected = filter_matrix
    )
  )
})

# Test filter functions
context("Filter function")
# test dc_filter
# filters data check result according to filtering vector
test_that("dc_filter", {
  # Data checks on example data
  # We expect warnings as not all columns are present
  dc <- names(data.checks@dc_body[c(1:3)])
  result <- expect_warning(perform_dc(testing_data, wanted_dc = dc))
  foo <- summary_dc(result, fancy = FALSE, filtering_dt = TRUE)
  # will be used for 'cell_selected' option, usually generated in shiny app
  filter_matrix <- matrix(c(seq(foo[,1]), 2, 3, 4), nrow = 3)
  # generating filters
  bar <- expect_silent(
    dc_filter_generate(
      dc_result_summary = foo, 
      cell_selected = filter_matrix
    )
  )
  # performing filtering
  fooo <- expect_silent(
    dc_filter(
      data = testing_data,
      # 'result' and 'bar' from previous test
      dc_result = result,
      dc_filts = bar
    )
  )
  expect_s3_class(fooo, "data.frame")
  # filter all 3 options at once
  bad_matrix <- matrix(c(rep(1, 3), 2, 3, 4), nrow = 3)
  bar <- expect_silent(
    dc_filter_generate(
      dc_result_summary = foo, 
      cell_selected = bad_matrix
    )
  )
  # performing filtering
  fooo <- expect_error(
    dc_filter(
      data = testing_data,
      # 'result' and 'bar' from previous test
      dc_result = result,
      dc_filts = bar
    )
  )
})

