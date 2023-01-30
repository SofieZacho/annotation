#!/bin/bash


# set working directory
WD=/user_data/szv/projects/comammox_2022/data/data_generated/anvio
cd $WD

# MAGs provided by Caitlin - Nitrospira (MGP1000 and Glomicave)
GENOMES=/projects/glomicave/HQMAG_database/symlinks
SEARCHFILE=/user_data/szv/projects/comammox_2022/notes/NOBs.txt
LOG=/user_data/szv/projects/comammox_2022/data/data_generated/anvio/CONTIGS/Nitrospira/log
THREADS=5

STORAGE=/user_data/szv/projects/comammox_2022/data/data_generated/anvio

# load modules
module load parallel
module load anvio/5.5.0-foss-2018a
module load anvio_environment/7.1-foss-2020b

mkdir -p
# # make MAGs into right anvio format - contig database
# cat $SEARCHFILE | parallel -j1 anvi-gen-contigs-database -f $GENOMES/{} \
#                           -o $STORAGE/CONTIGS/Nitrospira/{}_anvio-CONTIGS.db \
#                           '&>' $LOG/{}_anvio_gen_con_db.log


#################### annotations #################################
cat $SEARCHFILE | parallel -j1 anvi-run-hmms -c $STORAGE/CONTIGS/Nitrospira/{}_anvio-CONTIGS.db \
                  --num-threads $THREADS \





# # put genomes into anvio storage for pangenome analysis
LOG=/user_data/szv/projects/comammox_2022/data/data_generated/anvio/GENOMES/Nitrospira/log
cat $SEARCHFILE | parallel -j1 anvi-gen-genomes-storage -e $GENOMES/{} \
                          -o $STORAGE/GENOMES/Nitrospira/{}_anvio-GENOMES.db \
                          '&>' $LOG/{}_anvio_gen_con_db.log

# EX=/user_data/szv/projects/comammox_2022/notes/NOBs_contigsDB_modified.txt
# anvi-gen-genomes-storage -e $EX \
#                          -o $STORAGE/Nitrospira_anvio-GENOMES.db
