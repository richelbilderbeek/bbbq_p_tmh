# Creates peptides.csv

library(bbbq)
suppressMessages(library(dplyr))

peptide_sizes <- seq(20, 50, by = 10) # in amino acids

# 2: ?
n_peptides <- 2 # per size

if (mhcnuggetsr::is_on_ci()) {
  n_peptides <- 2
}

for (peptide_size in peptide_sizes) {
  filename <- glue::glue("peptides_{peptide_size}.csv")
  t <- tibble::tibble(
    peptide = replicate(
      n = n_peptides,
      bbbq::create_random_peptide(n_aas = peptide_size)
    )
  )
  readr::write_csv(t, filename)
}

