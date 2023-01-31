#!/bin/bash
WD=/user_data/szv/projects/comammox_2022/data/data_generated/anvio/pangenomics/01_NOBs
cd $WD

# load modules
module load anvio/7.1

# searchfile listing all contigs db including paths (generated with pangenomics workflow)
FILE=$WD/external-genomes.txt

# estimate metabolism (KEGG) - complete = 0.75 (default)
anvi-estimate-metabolism -e $FILE -O NOB \
 --matrix-format --include-metadata --include-zeros


 #hello
