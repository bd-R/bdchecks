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
  expect_warning(perform_dc(mtcars, "validation_taxonrank_empty"))
  # This will depend on data version
  expect_equal(sum(
    perform_dc(data_bats, "validation_taxonrank_empty")@flags[[1]]@result
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
        colnames(res[[i]])[1] <- "TARGET"
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