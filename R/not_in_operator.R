#' @title Not in operator
#'
#' @description Operator which tests whether vector or element x is not included in vector y. Equivalent to `!(x %in% y)`
#'
#' @examples
#' a <- c(1,2,3,4,5)
#' 3 %in% a
#' 3 %notin% a
#' 3 %!in% a
#' 6 %in% a
#' 6 %notin% a
#' 6 %!in% a
#'
#' @export
`%notin%` <- function(x, y) {
  !(x %in% y)
}

#' @export
`%!in%` <- function(x, y) {
  !(x %in% y)
}
