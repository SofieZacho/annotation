#!/bin/bash
WD=/user_data/szv/projects/comammox_2022/data/data_generated/anvio/pangenomics/Nitrospira/09_extract_from_anvio
cd $WD

# load modules
module load anvio/7.1
module load parallel

CONTIGS=/user_data/szv/projects/comammox_2022/data/data_generated/anvio/pangenomics/Nitrospira/02_CONTIGS
SEARCHFILE=/user_data/szv/projects/comammox_2022/notes/NOBs_without_fa.txt
ODIR=/user_data/szv/projects/comammox_2022/data/data_generated/anvio/pangenomics/Nitrospira/09_extract_from_anvio
LOG=/user_data/szv/projects/comammox_2022/data/data_generated/anvio/pangenomics/Nitrospira/09_extract_from_anvio/LOG

# extract gff file
# cat $SEARCHFILE | parallel -j1 anvi-get-sequences-for-gene-calls -c $CONTIGS/{}-contigs.db \
#                                 -o $ODIR/{}_pfam.gff \
#                                 --export-gff3 \
#                                 '&>' $LOG/{}_extract_gff_pfam.log

# extract genes as fasta sequences
cat $SEARCHFILE | parallel -j1 anvi-get-sequences-for-gene-calls -c $CONTIGS/{}-contigs.db \
                                -o $ODIR/{}_genes.fa \
                                -wrap 0 \
                                '&>' $LOG/{}_extract_genes.log

# with new fixes
# to see which annotation sources have been used in db: --list-annotation-sources
# implement --annotation-source
