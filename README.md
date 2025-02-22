# grepreaper

## Overview

`grepreaper` is a R package designed to enhance file reading capabilities using `grep`. While R provides many tools for reading files, `grepreaper` bridges the gap by offering powerful functions to:

- Count the number of records before reading data.
- Extract records matching specific patterns.
- Aggregate data from multiple files with identical structures.

This package provides user-friendly wrapper functions, eliminating the need for complex command-line syntax.

## Installation

You can install `grepreaper` from GitHub using:

```r
devtools::install_github("geeky33/grepreaper", build_vignettes = TRUE)
```

## Usage

Example function to count rows matching a pattern:

```r
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
```

## Contributing

We welcome contributions! Feel free to submit issues or pull requests to improve `grepreaper`.

## License

MIT License
