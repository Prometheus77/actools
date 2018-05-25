#' @title Including variables in message, warning, and stop text.
#'
#' @description Convenience function that replaces \code{message(paste0("This is
#'   ", x))}. Also available for \code{warning()} and \code{stop()}.
#'
#' @export
message0 <- function(...) {
  dots <- paste(..., collapse = "", sep = "")
  message(dots)
}

#' @export
stop0 <- function(...) {
  dots <- paste(..., collapse = "", sep = "")
  stop(dots)
}

#' @export
warning0 <- function(...) {
  dots <- paste(..., collapse = "", sep = "")
  warning(dots)
}
