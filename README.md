QC-Blind,a novel quality control pipeline for removing contaminants without any use of reference genomes. The pipeline requires only very little information from the marker genes of the target species. The entire pipeline consists of unsupervised read assembly, contig binning, read clustering and marker gene assignment. 


Fetures
===========

Reference-free:

Filter out contamination sequences totally based on information inside sequencing data

High accuracy:

Contigs or reads are highly concentrated in pure clusters which are easy to be found by marker genes

Multi-level QC:

The pipeline outstand at complex situations on multi-species level with different degree of contaminations

High throughput:

It's promising to analyse large scale resaerch exemplified as one relating to time series samples or replicates.


Functions & Commands
===========

##classification

$ sh classification.sh SAMPLE_NAME reads.fa

##concoct

$ sh concoct.sh SAMPLE_NAME contigs.fa PEreads1 PEreads2 species_number

##reads mapping contigs

$ sh reads_mapping.sh SAMPLE_NAME contigs_cutting.fa PEreads1 PEreads2

##find target_cluster

$ sh target_find.sh contigs_cutting.fa marker.fa clustering_gt1000.csv SAMPLE_NAME

##analysis clusters

$ sh blast_megahit.sh contigs_cutting.fa blast_result_file clustering_gt1000.csv out.F DIR_NAME

##evaluation

$ sh target_evaluation.sh clusterN(target cluster) contig_species cluster_sN(target cluster) out.F DIR_NAME

##dataloss

$ sh dataloss.sh contigs_list clustering_gt1000.csv out.F DIR_NAME

##extract target reads

$ sh findclusterreads.sh cluster_sN(target cluster) out.F SAMPLE_NAME

##coverage

$ python coverage_percent.py



Link to the synthetic metagenome
===========

https://www.ncbi.nlm.nih.gov/bioproject/PRJNA491366


Tools used to make this:
===========

Parallel_Meta

http://computationalbioenergy.org/parallel-meta.html

MEGAHIT

http://www.l3-bioinfo.com/products/megahit.html

CONCOCT

https://concoct.readthedocs.io/en/latest/

BLAST

https://blast.ncbi.nlm.nih.gov/Blast.cgi
