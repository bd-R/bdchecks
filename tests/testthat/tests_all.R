library(bdchecks)

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
  expect_equal(ncol(foo), 5)

  foo <- summary_dc(result, fancy = FALSE, filtering_dt = TRUE)
  expect_s3_class(foo, "data.frame")
  expect_match(colnames(foo)[3:5], "%")

  # Summary output 2
  foo <- summary_dc(result)
  expect_s3_class(foo, "knitr_kable")
})

# Test summary functions
context("Data Checks")
# test perform_dc
# performs data checks on a given data set
test_that("perform_dc", {
  # No data set provided will give warnings and null
  result <- expect_warning(perform_dc())
  expect_true(is.null(result))

  result <- expect_warning(perform_dc(data_bats))
  # we should have at least 18 performed DCs
  expect_gt(length(result@DC), 10)
})
# test performDC
# performs one data check on a given data set
test_that("perform_dc", {
  # No arguments provided
  expect_warning(perform_dc())
  expect_warning(perform_dc(mtcars, "monthInvalid"))
  # This will depend on data version
  expect_equal(sum(perform_dc(data_bats, "monthInvalid")@flags[[1]]@result), 1e3)
})