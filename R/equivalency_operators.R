#' @title Equivalency operators
#'
#' @description Equivalency operators that handle NAs, NULLs, and empty lists
#'   without throwing an error
#'
#' @examples
#' a <- NA
#' a == NA
#' a %==% NA
#'
#' b <- NULL
#' b == NULL
#' b %==% NULL
#'
#' x <- list()
#' x == list()
#' x %==% list()
#'
#' a %==% b
#' a %!=% b

#' @export
`%==%` <- function(x, y)
{
  if ((is_empty(x) || is_empty(y)) && !is.null(x) && !is.null(y))
  {
    return(is_empty(x) == is_empty(y))
  } else if (is.null(x) || is.null(y)) {
    return(is.null(x) == is.null(y))
  } else if (is.na(x) || is.na(y)) {
    return(is.na(x) == is.na(y))
  } else {
    return(x == y)
  }
}

#' @export
`%!=%` <- function(x, y)
{
  !(x %==% y)
}

is_empty <- function(x) {
  length(x) == 0
}
