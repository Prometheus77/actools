#' @title Autoformat
#' @description Automatically formats a number or vector of numbers to a specified format
#'
#' @param x Number or numeric vector
#' @param scheme Formatting scheme to apply. Default is "KMBT", meaning number will be shown as
#' trillions (T), billions (B), millions (M), thousands (K), or ones. In the case of any format
#' greater than ones, the number will be rounded to one decimal place.
#' @param format Format to apply (in absence of a scheme)
#'
#' @export
autoformat <- function(x, scheme = "KMBT", format = NULL) {
  if (scheme == "KMBT") {
    sapply(x, format_kmbt)
  } else {
    message0("Scheme '", scheme, "' not recognized.")
  }
}

format_kmbt <- function(x) {
  if (x >= 10^11) {
    paste0(format(round(x / 10^12, 1), nsmall = 1), " T")
  } else if (x >= 10^8) {
    paste0(format(round(x / 10^9, 1), nsmall = 1), " B")
  } else if (x >= 10^5) {
    paste0(format(round(x / 10^6, 1), nsmall = 1), " M")
  } else if (x >= 1000) {
    paste0(format(round(x / 1000, 1), nsmall = 1), " K")
  } else {
    round(x, 0)
  }
}
