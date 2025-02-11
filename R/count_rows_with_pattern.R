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
count_rows_with_pattern <- function(pattern) {
  # Write diamonds data to a temporary file
  temp_file <- tempfile(fileext = ".csv")

  # Save the diamonds dataset to the temporary file
  fwrite(diamonds, temp_file)

  # Use fread with grep to filter rows containing the specified pattern
  cmd <- paste("grep", shQuote(pattern), shQuote(temp_file))

  # Read the filtered result from grep
  result <- fread(cmd = cmd)

  # Clean up the temporary file to avoid clutter
  unlink(temp_file)

  # Return the number of matching rows
  return(nrow(result))
}

# Example usage
# count_rows_with_pattern("VS")
