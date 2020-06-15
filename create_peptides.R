# Creates peptides.csv

library(bbbq)
suppressMessages(library(dplyr))

n_aas <- 9

# 2: 1.5 minutes
# 100: 4 hours
# 1000: ?40 hours
n_peptides <- 2 # per haplotype

if (mhcnuggetsr::is_on_ci()) {
  n_peptides <- 2
}

t <- tibble::tibble(
  peptide = replicate(n = n_peptides, bbbq::create_random_peptide(n_aas = n_aas))
)

readr::write_csv(t, "peptides.csv")
