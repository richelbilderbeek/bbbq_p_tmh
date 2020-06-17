# Creates peptides.csv

library(bbbq)
suppressMessages(library(dplyr))

peptide_sizes <- seq(20, 50, by = 10) # in amino acids

# 10: some secsonds
n_peptides <- 100 # per size

if (mhcnuggetsr::is_on_ci()) {
  n_peptides <- 2
  peptide_sizes <- c(20, 50) # in amino acids
}

for (peptide_size in peptide_sizes) {
  filename <- glue::glue("peptides_{peptide_size}.csv")
  t <- tibble::tibble(
    peptide = replicate(
      n = n_peptides,
      bbbq::create_random_peptide(n_aas = peptide_size)
    ),
    is_tmh = NA
  )
  for (i in seq_len(nrow(t))) {
    t$is_tmh[i] <- pureseqtmr::is_tmh(t$peptide[i])
  }
  readr::write_csv(t, filename)
}
