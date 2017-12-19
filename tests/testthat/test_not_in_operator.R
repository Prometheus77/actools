context("not_in_operator")

test_that("not_in_operator properly returns false", {
  x <- c(1,2,3)
  expect_false(1 %!in% x)
})

test_that("not_in_operator properly returns true", {
  x <- c(1,2,3)
  expect_true(0 %!in% x)
})
