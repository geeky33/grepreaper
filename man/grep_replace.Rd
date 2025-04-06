\name{grep_replace}
\alias{grep_replace}
\title{Search and Replace Pattern in Files}
\description{
Searches for a specified pattern within files and replaces it with a given replacement string. This function is useful for batch editing or cleaning data files.
}
\usage{
grep_replace(files, pattern, replacement, ignore_case = FALSE, fixed = FALSE, backup = TRUE)
}
\arguments{
  \item{files}{Character vector of file paths to be processed.}
  \item{pattern}{Character string specifying the pattern to search for.}
  \item{replacement}{Character string to replace the matched pattern.}
  \item{ignore_case}{Logical; if \code{TRUE}, performs case-insensitive matching. Default is \code{FALSE}.}
  \item{fixed}{Logical; if \code{TRUE}, treats the pattern as a fixed string rather than a regular expression. Default is \code{FALSE}.}
  \item{backup}{Logical; if \code{TRUE}, creates a backup of the original file before making changes. Default is \code{TRUE}.}
}
\value{
Returns a logical vector indicating the success (\code{TRUE}) or failure (\code{FALSE}) of the replacement in each file.
}
\examples{
\dontrun{
# Replace all occurrences of 'old_string' with 'new_string' in the specified files
grep_replace(c("file1.txt", "file2.txt"), "old_string", "new_string")

# Perform case-insensitive replacement
grep_replace(c("file1.txt", "file2.txt"), "old_string", "new_string", ignore_case = TRUE)

# Treat the pattern as a fixed string
grep_replace(c("file1.txt", "file2.txt"), "old_string", "new_string", fixed = TRUE)

# Disable backup creation
grep_replace(c("file1.txt", "file2.txt"), "old_string", "new_string", backup = FALSE)
}
}
\seealso{
\code{\link{grep_files}}, \code{\link{grep_context}}
}
