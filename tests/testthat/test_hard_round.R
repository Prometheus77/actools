context("hard_round")

test_that("Rounds up", {
  x <- c(1.2, 1.3, 1.4)
  x_round <- hard_round(x, 1)
  expect_equal(x_round, c(1, 1, 2))
})

test_that("Rounds down", {
  x <- c(0.8, 0.7, 0.6)
  x_round <- hard_round(x, 1)
  expect_equal(x_round, c(1, 1, 0))
})

test_that("Breaks ties", {
  x <- c(1.4, 1.4, 1.4, 1.4, 1.4, 1.4)
  x_round <- hard_round(x, 1)
  expect_equal(sum(x_round), round(sum(x), 0))
})
