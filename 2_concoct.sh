#!/bin/bash

# $1 SAMPLE_NAME
# $2 contigs.fa
# $3 paired_reads1
# $4 paired_reads2
# $5 num_species
# $6 contig length cutoff

con = concoct_$1
test -d $con || mkdir $con
cd $con
mkdir contigs
mkdir map
mkdir input

cd ..
python /opt/tools/CONCOCT/scripts/cut_up_fasta.py -c 10000 -o 0 -m $2 > $con/contigs/megahit_c10K.fa
bowtie2-build $con/contigs/megahit_c10K.fa $con/contigs/megahit_c10K.fa
export MRKDUP=/home/gaoyan/picard-tools-1.95/MarkDuplicates.jar

bash /opt/gaoyan/script/map-bowtie2-markduplicates.sh -ct 1 -p '-f' $3 $4 pair $con/contigs/megahit_c10K.fa asm bowtie2
mv bowtie2 $con/map

python /opt/tools/CONCOCT/scripts/gen_input_table.py --isbedfiles $con/contigs/megahit_c10K.fa $con/map/bowtie2/asm_pair-smds.coverage > $con/input/concoct_inputtable.tsv

cut -f1,3- $con/input/concoct_inputtable.tsv > $con/input/concoct_inputtableR.tsv

concoct -c $5 --coverage_file $con/input/concoct_inputtableR.tsv --composition_file $con/contigs/megahit_c10K.fa -b output/ -l $6
mv output $con
