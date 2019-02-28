#' @title Using sprintf formatting variables in message, warning, and stop text.
#'
#' @description Convenience function that replaces \code{message(sprintf("This is
#'   %s", x))}. Also available for \code{warning()} and \code{stop()}.
#'
#' @export
messagef <- function(...) {
  dots <- c(as.list(environment()), list(...))
  message(do.call(sprintf, args = dots))
}

#' @export
stopf <- function(...) {
  dots <- c(as.list(environment()), list(...))
  stop(do.call(sprintf, args = dots))
}

#' @export
warningf <- function(...) {
  dots <- c(as.list(environment()), list(...))
  warning(do.call(sprintf, args = dots))
}
