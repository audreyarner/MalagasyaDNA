#!/bin/sh

#===============================================
#--Run smartpca (using program eigensoft)
#===============================================

source activate my_root

cp Pemba700finalwithContemp.bim Pemba700finalwithContemp.pedsnp

awk '!($6="")' Pemba700finalwithContemp.fam > Pemba700finalwithContempNoSex

yes 1 | head -n345 > Pemba700finalwithContempFinalLine

paste Pemba700finalwithContempNoSex Pemba700finalwithContempFinalLine > Pemba700finalwithContemp.pedind

/storage/home/ama6560/work/RindraPrograms/EIG/bin/smartpca -p /storage/home/ama6560/scratch/Malagasy/Pemba700/Pemba700finalwithContemp.par 