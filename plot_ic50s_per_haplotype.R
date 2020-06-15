# Get the distributions of IC50s for random peptides per haplotype
suppressMessages(library(ggplot2))
suppressMessages(library(dplyr))
suppressMessages(library(testthat))

df <- readr::read_csv("ic50s.csv")

n_peptides <- length(unique(df$peptide))
df$haplotype <- as.factor(df$haplotype)

ggplot(df, aes(x = haplotype, y = ic50)) +
  geom_boxplot() +
  xlab("Haplotype") +
  ylab("IC50") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(
    caption = glue::glue(
      "Peptides per haplotype: {n_peptides}. "
    )
  ) + ggsave("ic50s_per_haplotype.png", width = 7, height = 7)
