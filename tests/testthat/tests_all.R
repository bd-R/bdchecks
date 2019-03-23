library(bdchecks)

# Test summary functions
context("Summary Functions")
# test dc_summary
# outputs summary table for passed/failed data checks
test_that("dc_summary", {
  # Data checks on example data
  # We expect warnings as not all columns are present
  result <- expect_warning(dc_perform(data_bats))
  # Check if output is valid
  expect_s4_class(result, "dataCheckFlag")

  # Summary output 1
  foo <- dc_summary(result, fancy = FALSE, filtering_dt = FALSE)
  expect_s3_class(foo, "data.frame")
  expect_equal(nrow(foo), 22)
  expect_equal(ncol(foo), 5)
  expect_equal(ncol(foo), 5)

  foo <- dc_summary(result, fancy = FALSE, filtering_dt = TRUE)
  expect_s3_class(foo, "data.frame")
  expect_match(colnames(foo)[3:5], "%")

  # Summary output 2
  foo <- dc_summary(result)
  expect_s3_class(foo, "knitr_kable")
})



# Test summary functions
context("Data Checks")
# test dc_perform
# performs data checks on a given data set
test_that("dc_perform", {
  # No data set provided will give warnings and null
  result <- expect_warning(dc_perform())
  expect_true(is.null(result))

  result <- expect_warning(dc_perform(data_bats))
  # we should have at least 20 performed DCs
  expect_gt(length(result@DC), 20)
})
# test performDC
# performs one data check on a given data set
test_that("performDC", {
  # No arguments provided
  expect_error(performDC())
  expect_warning(performDC(DC_monthInvalid, mtcars))
  # This will depend on data version
  expect_equal(sum(performDC(DC_monthInvalid, data_bats)), 1000)
})