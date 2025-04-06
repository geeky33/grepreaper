\name{grep_context_csv}
\alias{grep_context_csv}
\title{Search for Pattern with Context Lines in CSV}
\description{
Searches for a specified pattern within a CSV file and returns the matching rows along with a specified number of context rows before and after each match.
}
\usage{
grep_context_csv(file_path, pattern, before = 0, after = 0, ignore_case = FALSE, fixed = FALSE, as_data_frame = FALSE)
}
\arguments{
  \item{file_path}{Character string specifying the path to the CSV file.}
  \item{pattern}{Character string specifying the pattern to search for.}
  \item{before}{Integer; number of lines to include before each matching row as context. Default is 0.}
  \item{after}{Integer; number of lines to include after each matching row as context. Default is 0.}
  \item{ignore_case}{Logical; if TRUE, performs case-insensitive matching. Default is FALSE.}
  \item{fixed}{Logical; if TRUE, treats the pattern as a fixed string rather than a regular expression. Default is FALSE.}
  \item{as_data_frame}{Logical; if TRUE, returns the result as a data frame; otherwise, returns a character vector. Default is FALSE.}
}
\value{
Returns a data frame or character vector containing the matching rows with the specified context.
}
\examples{
\dontrun{
# Assume 'sample_orders.csv' contains the sample data provided earlier
# Search for rows where the Product is 'Laptop' with 1 line before and after as context
grep_context_csv("sample_orders.csv", "Laptop", before = 1, after = 1)

# Case-insensitive search for 'tablet' with 2 lines of context after each match
grep_context_csv("sample_orders.csv", "tablet", before = 0, after = 2, ignore_case = TRUE)

# Search for 'Smartphone' treating the pattern as a fixed string, returning a data frame
grep_context_csv("sample_orders.csv", "Smartphone", fixed = TRUE, as_data_frame = TRUE)
}
}
\seealso{
\code{\link{grep_count}}, \code{\link{grep_read}}, \code{\link{grep_files}}
}
