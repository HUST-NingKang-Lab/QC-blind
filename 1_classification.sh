#!/bin/bash

# $1 SAMPLE_NAME
# $2 reads.fa

classification = classification_$1

test -d $classification || mkdir $classification

parallel-meta -m $2 -e 1

awk '{if ($9 != "Genus") print $9}' Result/taxonomy.txt | sort -d | uniq | awk '{if ($1 != "Unclassified") print $0}' | wc -l > num_species

mv Result num_species $classification
