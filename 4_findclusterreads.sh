#!/bin/bash

# $1 clusterN(target cluster)
# $2 out.F
# $3 sample_name

target = target_reads_$3
test -d $target || mkdir $target

line=$(cat $1 | wc -l)
for ((i=1; i<=$line; i=i+1))
do
	contig=$(head -n $i $1 | tail -n 1 | cut -d ',' -f 1)
	awk -v var="$contig" '{if ($3==var) print $0}' $2 >> $target/clusterreads
done
