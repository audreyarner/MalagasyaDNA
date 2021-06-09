#!/bin/sh

/storage/home/ama6560/work/RindraPrograms/stacks-2.53/populations -V Fingira2500ChimpforTreemix.vcf --treemix -O ./ -M Fingira2500_map.tsv

tail -n +2 Fingira2500ChimpforTreemix.p.treemix > Fingira2500NewTreemix

gzip Fingira2500NewTreemix

source activate my_root

/storage/home/ama6560/work/RindraPrograms/treemix/src/treemix -i Fingira2500NewTreemix.gz -root Chimpanzee -k 500 -o Treemix0

/storage/home/ama6560/work/RindraPrograms/treemix/src/treemix -i Fingira2500NewTreemix.gz -root Chimpanzee -k 500 -m 1 -o Treemix1

/storage/home/ama6560/work/RindraPrograms/treemix/src/treemix -i Fingira2500NewTreemix.gz -root Chimpanzee -k 500 -m 2 -o Treemix2

/storage/home/ama6560/work/RindraPrograms/treemix/src/treemix -i Fingira2500NewTreemix.gz -root Chimpanzee -k 500 -m 3 -o Treemix3

/storage/home/ama6560/work/RindraPrograms/treemix/src/treemix -i Fingira2500NewTreemix.gz -root Chimpanzee -k 500 -m 4 -o Treemix4
