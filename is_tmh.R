suppressMessages(library(ggplot2))
suppressMessages(library(dplyr))
library(testthat)

peptides_filename <- "peptides.csv"
expect_true(file.exists(peptides_filename))
df <- readr::read_csv(peptides_filename)

df$is_tmh <- NA

n_peptides <- nrow(df)
for (i in seq_len(n_peptides)) {
  df$is_tmh[i] <- pureseqtmr::is_tmh(df$peptide[i])
}

readr::write_csv(df, "is_tmh.csv")
