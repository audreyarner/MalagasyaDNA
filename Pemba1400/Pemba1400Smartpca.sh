#!/bin/sh

#===============================================
#--Run smartpca (using program eigensoft)
#===============================================

#this run will not have any outlier removal iterations
module load anaconda3

source activate my_root

cp Pemba1400finalwithContemp.bim Pemba1400finalwithContemp.pedsnp

awk '!($6="")' Pemba1400finalwithContemp.fam > Pemba1400finalwithContempNoSex

paste Pemba1400finalwithContempNoSex Pemba1400finalwithContempFinalLine > Pemba1400finalwithContemp.pedind

/storage/home/ama6560/work/RindraPrograms/EIG/bin/smartpca -p /storage/home/ama6560/scratch/Malagasy/Pemba1400/Pemba1400finalwithContemp.par 