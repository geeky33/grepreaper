# grepreaper
## Advanced Pattern Matching and Text Processing for R


`grepreaper` is an R package that harnesses the power of `grep` for efficient pattern matching, extraction, and text manipulation. While R offers many file reading capabilities, `grepreaper` provides powerful utilities that help you:

- Extract text matching specific patterns
- Count occurrences without loading entire files
- Replace text patterns in files efficiently
- Generate summaries of pattern matches across multiple files
- Extract context lines around matches (great for log analysis)

This package bridges the gap between R's data processing capabilities and the efficiency of command-line tools.

## Installation

```r
# Install development version from GitHub
devtools::install_github("geeky33/grepreaper", build_vignettes = TRUE)
```

## Key Features

- **Performance**: Leverages system commands for processing large files without loading them entirely into memory
- **Flexibility**: Works with files, strings, and R data objects
- **Context-aware**: Extract lines before and after matches (great for log files)
- **Data-friendly**: Return results as data frames or data.tables for further analysis
- **Comprehensive**: Replace, extract, count, and summarize pattern matches

## Function Overview

### Count Matching Rows

```r
library(grepreaper)

# Count rows in the diamonds dataset containing 'VS'
count_rows_with_pattern("VS")
```

### Extract Matching Content

```r
# Extract all lines containing a pattern
matches <- grep_extract("data/sample_orders.csv", "Laptop")

# With options for case sensitivity and more
grep_extract("data/sample_orders.csv", "laptop", ignore_case = TRUE)
```

### Replace Pattern in Files

```r
# Replace all occurrences of 'Laptop' with 'Computer'
grep_replace("data/sample_orders.csv", "Laptop", "Computer", backup = TRUE)
```

### Summarize Pattern Occurrences

```r
# Get summary statistics of pattern occurrences
summary <- grep_pattern_summary("VS")
print(summary)
```

### Extract with Context Lines

```r
# Get matches with surrounding context lines (before and after)
grep_context_csv("data/sample_orders.csv", "Laptop", before = 2, after = 2)
```

## Requirements

- R (>= 3.5.0)
- The `grep` command available on your system
- Required R packages: data.table, ggplot2

## Advanced Usage

View the package vignettes for more detailed examples:

```r
browseVignettes("grepreaper")
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

Aarya Pandey - aaryap1204@gmail.com

Project Link: [https://github.com/geeky33/grepreaper](https://github.com/geeky33/grepreaper)



