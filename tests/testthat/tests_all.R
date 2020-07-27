library(bdchecks)

# Test summary functions
context("Data Checks")
# test perform_dc
# performs data checks on a given data set
test_that("perform_dc", {
  # No data set provided will give warnings and null
  result <- expect_error(perform_dc())
  result <- expect_warning(perform_dc(data_bats))
  # we should have at least 18 performed DCs
  expect_gt(length(result@DC), 1)
  # No arguments provided
  expect_warning(perform_dc(data_bats))
  expect_warning(perform_dc(mtcars))
  expect_silent(
    perform_dc(data_bats, wanted_dc = "taxo_level", input = "family")
  )
  # This will depend on data version
  expect_equal(sum(
    perform_dc(data_bats, "taxonrank_present")@flags[[1]]@result
  ), 1e3)
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

# Test summary functions
context("Summary Functions")
# test dc_summary
# outputs summary table for passed/failed data checks
test_that("summary_dc", {
  # Data checks on example data
  # We expect warnings as not all columns are present
  result <- expect_warning(perform_dc(data_bats))
  # Check if output is valid
  expect_s4_class(result, "DataCheckFlagSet")
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

# Test class export functions
context("Export Functions")
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
})

# Test filter functions
context("Filter functions")
# test dc_filter_generate
# generates vector for filtering data checks result table
# according to `selectCells` object.
test_that("dc_filter_generate", {
  # Data checks on example data
  # We expect warnings as not all columns are present
  result <- expect_warning(perform_dc(data_bats))
  foo <- summary_dc(result, fancy = FALSE, filtering_dt = TRUE)
  bar <- expect_silent(dc_filter_generate(foo,foo[3]))
})

# Test dc functions
context("Unique dc cases: taxonrank_standard")
# test dc_taxonrank_standard
test_that("dc_taxonrank_standard", {
  foo <- unique(data_bats$taxonRank)
  # We expect warnings as not all columns are present
  bar <- expect_silent(dc_taxonrank_standard(input = foo, language = "all"))
  bar <- expect_warning(dc_taxonrank_standard(input = foo, language = "test"))
})

# Test dc functions
context("Unique dc cases: temporal_resolution")
# test dc_temporal_resolution
test_that("dc_temporal_resolution", {
  foo <- unique(data_bats$eventDate)
  # We expect warnings as not all columns are present
  bar <- expect_silent(
    dc_temporal_resolution(
      input = foo, 
      provided_input = c("2016-01-02", "2018-02-08", "day")
    )
  )
  bar <- expect_error(
    dc_temporal_resolution(
      input = foo, 
      provided_input = c("2016-01-02", "2018-02-08", "week")
    )
  )
})

# Test dc functions
context("Unique dc cases: taxo_level")
# test dc_taxo_level
test_that("dc_taxo_level", {
  foo <- unique(data_bats$taxonRank)
  # We expect warnings as not all columns are present
  bar <- expect_error(dc_taxo_level(input = foo, provided_input = "test"))
})

