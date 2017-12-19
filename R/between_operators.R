#' @title Between operators
#'
#' @description Between operators covering both inclusive and exclusive checks
#'
#' @examples
#' a <- c(0:10)
#' a %btwn% c(1,5) # inclusive between (1 and 5 included)
#' a %_btwn_% c(1,5) # exclusive between (1 and 5 not included)
#' @export
`%btwn%` <- function(x, y)
{
  x >= min(y) & x <= max(y)
}

#' @export
`%_btwn_%` <- function(x, y)
{
  x > min(y) & x < max(y)
}
