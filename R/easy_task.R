library(ggplot2)
library(data.table)

data(diamonds)
vs_rows <- grep("VS", diamonds$clarity)
num_vs_rows <- length(vs_rows)
print(num_vs_rows)
