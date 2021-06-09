#!/bin/sh

/storage/home/ama6560/work/RindraPrograms/stacks-2.53/populations -V Pemba1400ChimpforTreemix.vcf --treemix -O ./ -M Pemba1400_map.tsv

tail -n +2 Pemba1400ChimpforTreemix.p.treemix > Pemba1400NewTreemix

gzip Pemba1400NewTreemix

source activate my_root

/storage/home/ama6560/work/RindraPrograms/treemix/src/treemix -i Pemba1400NewTreemix.gz -root Chimpanzee -k 500 -o Treemix0

/storage/home/ama6560/work/RindraPrograms/treemix/src/treemix -i Pemba1400NewTreemix.gz -root Chimpanzee -k 500 -m 1 -o Treemix1

/storage/home/ama6560/work/RindraPrograms/treemix/src/treemix -i Pemba1400NewTreemix.gz -root Chimpanzee -k 500 -m 2 -o Treemix2

/storage/home/ama6560/work/RindraPrograms/treemix/src/treemix -i Pemba1400NewTreemix.gz -root Chimpanzee -k 500 -m 3 -o Treemix3

/storage/home/ama6560/work/RindraPrograms/treemix/src/treemix -i Pemba1400NewTreemix.gz -root Chimpanzee -k 500 -m 4 -o Treemix4
