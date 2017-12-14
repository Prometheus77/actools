context("equivalency_operators")

test_that("handles_NA", {
  a <- NA
  expect_true(a %==% NA)
})

test_that("handles_NA_not", {
  a <- NA
  expect_false(a %!=% NA)
})

test_that("handles_NULL", {
  a <- NULL
  expect_true(a %==% NULL)
})

test_that("handles_NULL_not", {
  a <- NULL
  expect_false(a %!=% NULL)
})

test_that("handles_empty_list", {
  a <- list()
  expect_true(a %==% list())
})

test_that("handles_empty_list_not", {
  a <- list()
  expect_false(a %!=% list())
})
