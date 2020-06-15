# Get the distributions of IC50s for random peptides per haplotype
suppressMessages(library(ggplot2))
suppressMessages(library(dplyr))
suppressMessages(library(testthat))

ic50s <- readr::read_csv("ic50s.csv")
is_tmh <- readr::read_csv("is_tmh.csv")

testthat::expect_true(all(unique(ic50s$peptide) == unique(is_tmh$peptide)))

t <- full_join(ic50s, is_tmh)

n_peptides <- length(unique(t$peptide))
t$haplotype <- as.factor(t$haplotype)

ggplot(t, aes(x = haplotype, y = ic50)) +
  geom_boxplot() +
  facet_grid(is_tmh ~ .) +
  xlab("Haplotype") +
  ylab("IC50") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(
    caption = glue::glue(
      "Peptides per haplotype: {n_peptides}. "
    )
  ) + ggsave("ic50s_per_haplotype_tmh.png", width = 7, height = 7)
