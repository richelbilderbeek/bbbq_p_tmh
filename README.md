# bbbq_random_peptides

Branch   |[![Travis CI logo](pics/TravisCI.png)](https://travis-ci.org)                                                                             
---------|------------------------------------------------------------------------------------------------------------------------------------------
`master` |[![Build Status](https://travis-ci.org/richelbilderbeek/bbbq_random_peptides.svg?branch=master)](https://travis-ci.org/richelbilderbeek/bbbq_random_peptides) 
`develop`|[![Build Status](https://travis-ci.org/richelbilderbeek/bbbq_random_peptides.svg?branch=develop)](https://travis-ci.org/richelbilderbeek/bbbq_random_peptides)

BBBQ: random peptides

## Goal
 
 * Determine percentage of random peptides that is TMH
 * Determine per haplotype the range of IC50, so that a 
   binder (IC50 is the lowest 5%) can be defined

## Create data

 * Creates random peptides: 
    * [x] script: `create_peptides.R`
    * [x] `peptides.csv`, column names: `peptide` 
 * Per peptide:
    * [x] script: `is_tmh.R`
    * [x] is TMH: `is_tmh.csv`, column names: `peptide`, `is_tmh`
 * Per peptide, per haplotype, determine:
    * [x] script: `ic50s.R`
    * [x] IC50: `ic50s.csv`, column names: `peptide`, `haplotype`, `ic50`

## Plot

 * Percentage of TMHs: 
    * [x] script filename: `plot_perc_tmh.R`
    * [x] figure filename: `perc_tmh.png`
 * IC50 per haplotype: 
    * [x] script filename: `plot_ic50s_per_haplotype.R`
    * [x] figure filename: `ic50s_per_haplotype.png`
 * IC50 per haplotype, separated by being TMH: 
    * [x] script filename: `plot_ic50s_per_haplotype_per_tmh.R`
    * [x] figure filename: `ic50s_per_haplotype_per_tmh.png`

