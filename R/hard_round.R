#' @title Round values in a vector to sum properly
#'
#' @description Takes a vector of values that are meant to be added together and
#'   rounds them in such a way that the sum of each of the rounded values equals
#'   the rounded sum of the unrounded values. For example, \code{c(1.2, 1.3,
#'   1.4)} sums to 3.9, which becomes 4 when rounded to the nearest integer.
#'   However, rounding each of the values to the nearest integer produces
#'   \code{c(1, 1, 1)}, which only sums to 3. This function will "hard round"
#'   the 1.4 up to 2, so that the resulting vector \code{c(1, 1, 2)} sums to 4.
#'   This is a common practice in preparing financial statements.
#'
#' @param x A numeric vector of values to be rounded.
#' @param units A number indicating the units to which to round. Unlike R's
#'   \code{round} function which takes the argument \code{digits} and only
#'   allows you to round to decimal places, \code{hard_round} takes the actual
#'   unit of rounding, e.g. 1 for nearest integer, 10 for nearest ten, 0.1 for
#'   nearest tenth. It can also round to non-decimal units, such as 5 or 0.2.
#'
#' @examples
#' hard_round(x = c(1.2, 1.3, 1.4), units = 1)
#' @export

hard_round <- function(x, units) {
  checkmate::assert_numeric(x, all.missing = FALSE)
  checkmate::assert_number(units)
  if (units == 0) stop("units must not be set to 0")

  x_sum <- sum(x, na.rm = TRUE)
  x_round <- round(x / units, 0) * units

  while (sum(x_round) != round(x_sum / units, 0) * units) {
    x_diff <- x - x_round
    if (x_sum - sum(x_round, na.rm = TRUE) > 0) {
      max_diff <- max(x_diff, na.rm = TRUE)
      max_index <- which(x_diff == max_diff)
      if (length(max_index) > 1) max_index <- sample(max_index, 1)
      x_round[max_index] <- x_round[max_index] + units
    } else {
      min_diff <- min(x_diff, na.rm = TRUE)
      min_index <- which(x_diff == min_diff)
      if (length(min_index) > 1) min_index <- sample(min_index, 1)
      x_round[min_index] <- x_round[min_index] - units
    }
  }

  x_round
}
