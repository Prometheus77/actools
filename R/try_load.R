#' @title Try to load a file before parsing an expression
#'
#' @description
#' Checks whether a file exists, and if so loads it. If the file
#' doesn't exist, it runs an expression and optionally saves it
#' to that filename. Useful for scripts that take a long time to
#' run and where you want to save progress along the way.
#'
#' @param filename Name of the file to try to load. Should be in RDS format.
#' @param expr Expression to run if the file doesn't exist.
#' @param save After expression is run, save the result as \code{filename}? Default is \code{FALSE}.
#' @param ... Additional arguments to pass to \code{saveRDS} if \code{save == TRUE}.
#'
#' @examples
#' # Load setosa_glm.RDS if it exists, otherwise create and save it with this
#' # script
#' setosa_glm <- try_load("setosa_glm.RDS", save = TRUE,
#'   {
#' setosa <- iris[, 1:3]
#' setosa$setosa <- ifelse(iris$Species == "setosa", 1, 0)
#' setosa_glm <- glm(setosa ~ ., data = setosa)
#'   })
#'
#' @export
try_load <- function(filename, expr, save = FALSE, ...) {
  if (file.exists(filename)) {
    message(sprintf("Loading %s", filename))
    readRDS(filename)
  } else {
    output <- evalq(expr)
    if (save == TRUE) {
      message(sprintf("Saving %s", filename))
      dots <- list(...)
      do.call("saveRDS", c(list(object = output, file = filename), dots))
    }
    output
  }
}
