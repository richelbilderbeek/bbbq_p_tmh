# Usage:
#
# * On local, creates figures:
#
#   make
#
# * On Peregrine, creates data:
# 
#   make data
#
#   (do this by 'sbatch make.sh)
#

# all creates the figures, use 'make data' to generate the data
all: perc_tmh.png ic50s_per_haplotype.png ic50s_per_haplotype_per_tmh.png

perc_tmh.png: plot_perc_tmh.R
	Rscript plot_perc_tmh.R

ic50s_per_haplotype.png: plot_ic50s_per_haplotype.R
	Rscript plot_ic50s_per_haplotype.R

ic50s_per_haplotype_per_tmh.png: plot_ic50s_per_haplotype_per_tmh.R
	Rscript plot_ic50s_per_haplotype_per_tmh.R

data: peptides.csv is_tmh.csv ic50.csv

peptides.csv: create_peptides.R
	Rscript create_peptides.R

is_tmh.csv: is_tmh.R
	Rscript is_tmh.R

ic50.csv: ic50.R
	Rscript ic50.R

zip:
	zip bbbq_random_peptides.zip *.csv *.png *.log *.R Makefile *.sh

clean:
	rm -f *.png *.pdf *.log *.png *.csv

