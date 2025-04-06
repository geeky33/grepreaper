#' Summary of pattern occurrences
#' 
#' This function counts the number of matches per file and total matches.
#' 
#' @param files Character vector of file paths.
#' @param pattern Pattern to search for.
#' @param ignore_case Logical; if TRUE, perform case-insensitive matching.
#' @param fixed Logical; if TRUE, pattern is a fixed string, not a regular expression.
#' @param recursive Logical; if TRUE, search recursively through directories.
#' 
#' @return data.table with columns: file, count.
#' 
#' @examples
#' \dontrun{
#' grep_summary("data/sample_data.csv", "IT")
#' }
#' 
#' @importFrom data.table data.table
#' @export
grep_summary <- function(files, pattern, ignore_case = FALSE, fixed = FALSE, recursive = FALSE) {
  
  if (!is.character(files) || length(files) == 0) {
    stop("'files' must be a non-empty character vector")
  }
  
  if (!is.character(pattern) || length(pattern) != 1) {
    stop("'pattern' must be a single character string")
  }
  
  options <- "-c"
  if (ignore_case) options <- paste(options, "-i")
  if (fixed) options <- paste(options, "-F")
  if (recursive) options <- paste(options, "-r")
  if (length(files) > 1) options <- paste(options, "-H")
  
  cmd <- build_grep_cmd(pattern, files, options)
  
  result <- safe_system_call(cmd)
  
  if (length(result) == 0) {
    return(data.table::data.table(file = character(0), count = integer(0)))
  }
  
  dt <- data.table::rbindlist(lapply(result, function(line) {
    parts <- strsplit(line, ":", fixed = TRUE)[[1]]
    if (length(parts) >= 2) {
      data.table::data.table(file = parts[1], count = as.integer(parts[2]))
    } else {
      data.table::data.table(file = files[1], count = as.integer(parts[1]))
    }
  }))
  
  return(dt)
}
