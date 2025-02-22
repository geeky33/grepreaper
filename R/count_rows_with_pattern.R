library(data.table)
library(ggplot2)

#' Count Rows Containing a Specific Pattern in the Diamonds Dataset
#'
#' This function writes the `diamonds` dataset from the `ggplot2` package to a temporary CSV file,
#' filters rows containing the user-specified pattern using a shell `grep` command, and counts the number
#' of matching rows.
#'
#' @param pattern A character string specifying the pattern to search for within the dataset rows.
#'
#' @return An integer representing the number of rows in the `diamonds` dataset
#'   where the user-specified pattern is found.
#'
#' @examples
#' count_rows_with_pattern("VS")
#'
#' @import data.table ggplot2
#' @export
count_rows_with_pattern <- function(pattern) {
  # Write diamonds data to a temporary file
  temp_file <- tempfile(fileext = ".csv")

  # Save the diamonds dataset to the temporary file
  fwrite(diamonds, temp_file)

  # Use grep -c to count occurrences without loading data into R
  cmd <- paste("grep -c", shQuote(pattern), shQuote(temp_file))

  # Execute the command and capture the count
  result <- as.integer(system(cmd, intern = TRUE))

  # Clean up the temporary file
  unlink(temp_file)

  # Return the count
  return(result)
}


# Example usage
# count_rows_with_pattern("VS")
