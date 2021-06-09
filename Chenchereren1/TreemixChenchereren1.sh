#!/bin/sh

/storage/home/ama6560/work/RindraPrograms/stacks-2.53/populations -V Chenchereren1ChimpforTreemix.vcf --treemix -O ./ -M Chenchereren1_map.tsv

tail -n +2 Chenchereren1ChimpforTreemix.p.treemix > Chenchereren1NewTreemix

gzip Chenchereren1NewTreemix

source activate my_root

/storage/home/ama6560/work/RindraPrograms/treemix/src/treemix -i Chenchereren1NewTreemix.gz -root Chimpanzee -k 500 -o Treemix0

/storage/home/ama6560/work/RindraPrograms/treemix/src/treemix -i Chenchereren1NewTreemix.gz -root Chimpanzee -k 500 -m 1 -o Treemix1

/storage/home/ama6560/work/RindraPrograms/treemix/src/treemix -i Chenchereren1NewTreemix.gz -root Chimpanzee -k 500 -m 2 -o Treemix2

/storage/home/ama6560/work/RindraPrograms/treemix/src/treemix -i Chenchereren1NewTreemix.gz -root Chimpanzee -k 500 -m 3 -o Treemix3

/storage/home/ama6560/work/RindraPrograms/treemix/src/treemix -i Chenchereren1NewTreemix.gz -root Chimpanzee -k 500 -m 4 -o Treemix4
