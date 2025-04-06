\name{grep_summary}
\alias{grep_summary}
\title{Summarize Pattern Occurrences Across Multiple Files}
\description{
Provides a summary report of pattern occurrences across multiple files, detailing the number of matches per file and the total number of matches.
}
\usage{
grep_summary(files, pattern, ignore_case = FALSE, fixed = FALSE)
}
\arguments{
  \item{files}{Character vector of file paths to be searched.}
  \item{pattern}{Character string specifying the pattern to search for.}
  \item{ignore_case}{Logical; if \code{TRUE}, performs case-insensitive matching. Default is \code{FALSE}.}
  \item{fixed}{Logical; if \code{TRUE}, treats the pattern as a fixed string rather than a regular expression. Default is \code{FALSE}.}
}
\value{
Returns a data frame with columns: \code{file}, \code{match_count}, and \code{total_matches}, indicating the number of matches per file and the total number of matches across all files.
}
\examples{
\dontrun{
# Summarize occurrences of 'search_term' in the specified files
summary <- grep_summary(c("file1.txt", "file2.txt"), "search_term")

# Perform case-insensitive search
summary <- grep_summary(c("file1.txt", "file2.txt"), "search_term", ignore_case = TRUE)

# Treat the pattern as a fixed string
summary <- grep_summary(c("file1.txt", "file2.txt"), "search_term", fixed = TRUE)
}
}
\seealso{
\code{\link{grep_count}}, \code{\link{grep_files}}
}
