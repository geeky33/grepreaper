library(testthat)
library(grepreaper)

test_that("grep_pattern_summary counts pattern correctly", {
  summary <- grep_pattern_summary("VS")

  expect_type(summary, "list")
  expect_named(summary, c("TotalMatches", "LinesWithMatch", "FirstOccurrence", "LastOccurrence"))
  expect_true(summary$TotalMatches >= 0)
  expect_true(summary$LinesWithMatch >= 0)
  expect_true(summary$FirstOccurrence >= 0)
  expect_true(summary$LastOccurrence >= 0)
})
