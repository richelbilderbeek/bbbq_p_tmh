# Usage:
#
# * On local, creates figures:
#
#   make
#
# * On Peregrine, creates data:
# 
#   make
#
#   (do this by 'sbatch make.sh)
#

all: peptides.csv is_tmh.csv

peptides.csv: create_peptides.R
	Rscript create_peptides.R

is_tmh.csv: is_tmh.R
	Rscript is_tmh.R

zip:
	zip bbbq_p_tmh.zip *.csv *.png *.log *.R Makefile *.sh

clean:
	rm -f *.png *.pdf *.log *.png *.csv

