context("between_operators")

test_that("inclusive between works", {
  a <- c(0:6)
  output <- a %btwn% c(1,5)
  expect_equal(output, c(F, T, T, T, T, T, F))
})

test_that("exclusive between works", {
  a <- c(0:6)
  output <- a %_btwn_% c(1,5)
  expect_equal(output, c(F, F, T, T, T, F, F))
})
