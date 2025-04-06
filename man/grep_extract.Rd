\name{grep_extract}
\alias{grep_extract}
\title{Extract Matching Lines from Files}

\description{
This function searches for lines in the given files that match a specified pattern and returns those lines.
Useful for extracting relevant information from large files for further analysis within R.
}

\usage{
grep_extract(files, pattern, ignore_case = FALSE, fixed = FALSE, invert = FALSE)
}

\arguments{
  \item{files}{Character vector of file paths to be searched.}
  \item{pattern}{Pattern to search for (regular expression or fixed string).}
  \item{ignore_case}{Logical; if TRUE, perform case-insensitive matching.}
  \item{fixed}{Logical; if TRUE, treat the pattern as a fixed string.}
  \item{invert}{Logical; if TRUE, extract lines that do NOT match the pattern.}
}

\value{
Returns a named list where each element corresponds to a file.
Each element is a character vector of matching lines from that file.
If no matches are found in a file, the element will be an empty character vector.
}

\examples{
\dontrun{
# Extract lines containing "error"
errors <- grep_extract(c("log1.txt", "log2.txt"), "error")

# Extract lines not containing "success"
not_success <- grep_extract(c("log1.txt", "log2.txt"), "success", invert = TRUE)

# Case-insensitive search
matches <- grep_extract("report.txt", "WARNING", ignore_case = TRUE)

# Treat pattern as fixed string
matches <- grep_extract("report.txt", "[abc]", fixed = TRUE)
}
}

\seealso{
\code{\link{grep_files}}, \code{\link{grep_count}}, \code{\link{grep_summary}}
}
