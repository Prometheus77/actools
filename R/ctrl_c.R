#' @title Control-C
#'
#' @description
#' Copies a data frame to the clipboard (in Windows) in a format suitable for copy-and-paste into a spreadsheet program such as Microsoft Excel.
#'
#' @param table A data table to be copied to the clipboard
#'
#' @export
ctrl_c <- function(table, sep = "\t", row.names = FALSE, col.names = TRUE) {
  utils::write.table(table, "clipboard", sep = sep, row.names = row.names, col.names = col.names)
}
