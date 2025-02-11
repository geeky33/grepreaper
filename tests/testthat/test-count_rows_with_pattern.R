library(testthat)

test_that("count_rows_with_pattern returns correct counts", {
  expect_gt(count_rows_with_pattern("VS"), 0) # Should find at least one match
  expect_gt(count_rows_with_pattern("SI"), 0) # Should find at least one match
})

test_that("count_rows_with_pattern returns zero for non-matching pattern", {
  expect_equal(count_rows_with_pattern("XYZ"), 0) # Should return 0 as "XYZ" doesn't exist
})

test_that("count_rows_with_pattern handles case sensitivity", {
  expect_equal(count_rows_with_pattern("vs"), 0) # Since grep is case-sensitive by default
  expect_gt(count_rows_with_pattern("VS2"), 0) # Should find valid entries
})
