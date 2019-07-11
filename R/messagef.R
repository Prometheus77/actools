#' @title Using sprintf formatting variables in message, warning, and stop text.
#'
#' @description Convenience function that replaces `message(sprintf("This is %s", x))`. Also available for `warning()` and `stop()`.
#'
#' @export
messagef = function(...) {
  dots = c(as.list(environment()), list(...))
  output = do.call(sprintf, args = dots)
  message(output)
}

#' @export
stopf = function(...) {
  dots = c(as.list(environment()), list(...))
  output = do.call(sprintf, args = dots)
  stop(output)
}

#' @export
warningf = function(...) {
  dots = c(as.list(environment()), list(...))
  output = do.call(sprintf, args = dots)
  warning(output)
}
