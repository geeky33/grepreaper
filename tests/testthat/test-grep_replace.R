library(testthat)
library(grepreaper)

test_that("grep_replace_pattern replaces text correctly", {
  # Create a temporary file with test content
  temp_file <- tempfile(fileext = ".txt")
  writeLines(c("Apple Mango Banana", "Mango is sweet", "I like Mango"), temp_file)

  # Replace 'Mango' with 'Orange'
  grep_replace_pattern(temp_file, "Mango", "Orange")

  updated_content <- readLines(temp_file)

  expect_false(any(grepl("Mango", updated_content)))
  expect_true(all(grepl("Orange", updated_content)))

  # Clean up
  unlink(temp_file)
})
