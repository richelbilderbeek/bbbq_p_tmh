# Usage:
#
# * On local:
#
#   make
#
# * On Peregrine:
# 
#   make
#
#   (do this by 'sbatch make.sh)
#

all: peptides.csv

peptides.csv: create_peptides.R
	Rscript create_peptides.R

zip:
	zip bbbq_p_tmh.zip *.csv *.png *.log *.R Makefile *.sh

clean:
	rm -f *.png *.pdf *.log *.png *.csv

