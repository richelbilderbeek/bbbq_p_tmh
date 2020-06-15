# Get the distributions of IC50s for random peptides per haplotype
suppressMessages(library(ggplot2))
suppressMessages(library(dplyr))
suppressMessages(library(testthat))

df <- readr::read_csv("ic50s_per_haplotype.csv")

n_peptides <- length(unique(df$peptide))
n_aas <- nchar(df$peptide)[1]

ggplot(df, aes(x = as.factor(haplotype), y = ic50)) +
  geom_boxplot() +
  xlab("Haplotype") +
  ylab("IC50 (nM)") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  ggplot2::labs(
    caption = glue::glue(
      "Number of random peptides: {n_peptides}, peptide length: {n_aas} amino acids"
    )
  ) + ggplot2::ggsave("ic50s_per_haplotype.png", width = 7, height = 7)
