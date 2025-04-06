#' Extract only matched lines
#' 
#' This function searches for a pattern in files and returns only the matched lines.
#' Similar to grep without context lines.
#' 
#' @param files Character vector of file paths.
#' @param pattern Pattern to search for.
#' @param ignore_case Logical; if TRUE, perform case-insensitive matching.
#' @param fixed Logical; if TRUE, pattern is a fixed string, not a regular expression.
#' @param show_cmd Logical; if TRUE, print the grep command used.
#' @param recursive Logical; if TRUE, search recursively through directories.
#' @param word_match Logical; if TRUE, match only whole words.
#' @param as_data_table Logical; if TRUE, return a data.table instead of character vector.
#' 
#' @return Character vector of matched lines, or data.table if as_data_table is TRUE.
#' 
#' @examples
#' \dontrun{
#' grep_extract("data/sample_data.csv", "IT")
#' }
#' 
#' @importFrom data.table data.table
#' @export
grep_extract <- function(files, pattern, ignore_case = FALSE, fixed = FALSE,
                         show_cmd = FALSE, recursive = FALSE, word_match = FALSE,
                         as_data_table = FALSE) {
  
  if (!is.character(files) || length(files) == 0) {
    stop("'files' must be a non-empty character vector")
  }
  
  if (!is.character(pattern) || length(pattern) != 1) {
    stop("'pattern' must be a single character string")
  }
  
  options <- "-n"
  if (ignore_case) options <- paste(options, "-i")
  if (fixed) options <- paste(options, "-F")
  if (recursive) options <- paste(options, "-r")
  if (word_match) options <- paste(options, "-w")
  if (length(files) > 1) options <- paste(options, "-H")
  
  cmd <- build_grep_cmd(pattern, files, options)
  
  if (show_cmd) return(cmd)
  
  result <- safe_system_call(cmd)
  
  if (length(result) == 0) {
    return(if (as_data_table) data.table::data.table(
      file = character(0), line_num = integer(0), content = character(0)
    ) else character(0))
  }
  
  if (as_data_table) {
    dt <- parse_grep_output(result)
    return(dt)
  }
  
  return(result)
}
