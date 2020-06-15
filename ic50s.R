suppressMessages(library(ggplot2))
suppressMessages(library(dplyr))
library(testthat)

peptides_filename <- "peptides.csv"
expect_true(file.exists(peptides_filename))
df <- readr::read_csv(peptides_filename)

df <- rbind(
  tidyr::expand_grid(peptide = df$peptide, mhc_class = "I", haplotype = bbbq::get_mhc1_haplotypes()),
  tidyr::expand_grid(peptide = df$peptide, mhc_class = "II", haplotype = bbbq::get_mhc2_haplotypes())
)
df$ic50 <- NA

n_rows <- nrow(df)
for (i in seq_len(n_rows)) {
  mhcnuggets_name <- mhcnuggetsr::to_mhcnuggets_name(df$haplotype[i])
  if (!mhcnuggetsr::is_mhcnuggets_name(mhcnuggets_name)) {
    stop(
      "Not MHCnuggets name. \n",
      "Haplotype: ", df$haplotype[i], "\n",
      "mhcnuggets_name: ", mhcnuggets_name
    )
  }
}


for (i in seq_len(n_rows)) {
  peptide <- df$peptide[i]
  mhcnuggets_options <- mhcnuggetsr::create_mhcnuggets_options(
    mhc_class =  df$mhc_class[i],
    mhc = mhcnuggetsr::to_mhcnuggets_name(df$haplotype[i])
  )
  mhcnuggetsr::check_mhcnuggets_options(mhcnuggets_options)
  ic50 <- mhcnuggetsr::predict_ic50(
    mhcnuggets_options = mhcnuggets_options,
    peptides = peptide
  )$ic50
  expect_equal(1, length(ic50))
  df$ic50[i] <- ic50
}

readr::write_csv(df, "ic50s.csv")
