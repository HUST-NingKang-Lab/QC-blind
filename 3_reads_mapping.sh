#!/bin/bash

# $1 SAMPLE_NAME
# $2 contigs_cutting
# $3 paired_reads_1
# $4 paired_reads_2

reads_map = reads_map_contigs_$1
test -d $reads_map || mkdir $reads_map

bowtie2-build $2 index

bowtie2 -f -x index -1 $3 -2 $4 -S out.sam

mv index.* out.sam $reads_map

samtools view -bS $reads_map/out.sam > $reads_map/out.bam
samtools view -F 4 $reads_map/out.bam > $reads_map/out.F
samtools flagstat $reads_map/out.bam > $reads_map/log
