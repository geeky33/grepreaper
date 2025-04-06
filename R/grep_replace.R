#' Replace matched pattern in files
#' 
#' This function searches for a pattern in files and replaces it with a replacement string.
#' 
#' @param files Character vector of file paths.
#' @param pattern Pattern to search for.
#' @param replacement String to replace the pattern with.
#' @param ignore_case Logical; if TRUE, perform case-insensitive matching.
#' @param fixed Logical; if TRUE, pattern is a fixed string, not a regular expression.
#' @param backup Logical; if TRUE, create a backup file with .bak extension.
#' 
#' @return Invisible NULL
#' 
#' @examples
#' \dontrun{
#' grep_replace("data/sample_data.csv", "IT", "Information Technology")
#' }
#' 
#' @export
grep_replace <- function(files, pattern, replacement, ignore_case = FALSE,
                         fixed = FALSE, backup = TRUE) {
  
  if (!is.character(files) || length(files) == 0) {
    stop("'files' must be a non-empty character vector")
  }
  
  if (!is.character(pattern) || length(pattern) != 1) {
    stop("'pattern' must be a single character string")
  }
  
  for (file in files) {
    lines <- readLines(file, warn = FALSE)
    
    lines_new <- if (fixed) {
      gsub(pattern, replacement, lines, fixed = TRUE)
    } else if (ignore_case) {
      gsub(pattern, replacement, lines, ignore.case = TRUE)
    } else {
      gsub(pattern, replacement, lines)
    }
    
    if (backup) file.copy(file, paste0(file, ".bak"), overwrite = TRUE)
    
    writeLines(lines_new, file)
  }
  
  invisible(NULL)
}
