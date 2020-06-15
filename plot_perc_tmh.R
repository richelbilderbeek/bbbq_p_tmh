# Get the distributions of IC50s for random peptides per haplotype
suppressMessages(library(ggplot2))
suppressMessages(library(dplyr))
suppressMessages(library(testthat))

df <- readr::read_csv("is_tmh.csv")
n_peptides <- length(unique(df$peptide))
n_aas <- nchar(df$peptide)[1]

counts <-  df %>% group_by(is_tmh) %>% summarise(n())
names(counts) <- c("is_tmh", "n")
counts$perc <- counts$n / sum(counts$n)

ggplot(counts, aes(x = is_tmh, y = perc)) +
  geom_col() +
  scale_y_continuous(labels = scales::percent) +
  xlab("Is TMH?") +
  ylab("Percentage") +
  ggplot2::labs(
    caption = glue::glue(
      "Number of random peptides: {n_peptides}, peptide length: {n_aas} amino acids"
    )
  ) + ggplot2::ggsave("perc_tmh.png", width = 7, height = 7)
