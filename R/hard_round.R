#' Round the values in a vector in such a way that the sum of each of
#' the rounded values exactly matches the rounded sum of each of the values
#'
#' @param x A vector.
#' @param units A number indicating the rounded units.
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
