library(bdchecks)

# Test summary functions
context("Summary Functions")
# test summary_DC
# outputs summary table for passed/failed data checks
test_that("summary_DC", {
    # Data checks on example data
    # We expect warnings as not all columns are present
    result <- expect_warning(performDataCheck(dataBats))
    # Check if output is valid
    expect_s4_class(result, "dataCheckFlag")

    # Summary output 1
    foo <- summary_DC(result, fancy = FALSE, filteringDT = FALSE)
    expect_s3_class(foo, "data.frame")
    expect_equal(nrow(foo), 22)
    expect_equal(ncol(foo), 5)
    expect_equal(ncol(foo), 5)

    foo <- summary_DC(result, fancy = FALSE, filteringDT = TRUE)
    expect_s3_class(foo, "data.frame")
    expect_match(colnames(foo)[3:5], "%")

    # Summary output 2
    foo <- summary_DC(result)
    expect_s3_class(foo, "knitr_kable")
})



# Test summary functions
context("Data Checks")
# test performDataCheck
# performs data checks on a given data set 
test_that("performDataCheck", {
    # No data set provided will give warnings and null
    result <- expect_warning(bdchecks::performDataCheck())
    expect_true(is.null(result))

    result <- expect_warning(bdchecks::performDataCheck(dataBats))
    # we should have at least 20 performed DCs
    expect_gt(length(result@DC), 20)
})
# test performDC
# performs one data check on a given data set 
test_that("performDC", {
    # No arguments provided
    expect_error(bdchecks::performDC())
    expect_warning(bdchecks::performDC(DC_monthInvalid, mtcars))
    # This will depend on data version
    expect_equal(sum(bdchecks::performDC(DC_monthInvalid, dataBats)), 1000)
})