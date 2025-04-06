test_that("grep_extract works with basic patterns", {
  text <- "Sample text with 123 numbers 456"
  expect_equal(grep_extract(text, "\\d+"), c("123", "456"))
  expect_equal(grep_extract(text, "[a-z]+"), c("ample", "text", "with", "numbers"))
})

test_that("grep_extract handles capture groups", {
  date <- "2023-01-15"
  expect_equal(grep_extract(date, "(\\d{4})-(\\d{2})-(\\d{2})", group = 2), "01")
})

test_that("grep_extract reads files", {
  tmp <- tempfile()
  writeLines("test content 123", tmp)
  expect_equal(grep_extract(tmp, "\\d+"), "123")
  unlink(tmp)
})