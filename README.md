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

  # Use fread with grep to filter rows containing the specified pattern
  cmd <- paste("grep", shQuote(pattern), shQuote(temp_file))

  # Read the filtered result from grep
  result <- fread(cmd = cmd)

  # Clean up the temporary file to avoid clutter
  unlink(temp_file)

  # Return the number of matching rows
  return(nrow(result))
}
```

## Contributing

We welcome contributions! Feel free to submit issues or pull requests to improve `grepreaper`.

## License

MIT License
