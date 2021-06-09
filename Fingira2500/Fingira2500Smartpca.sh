#!/bin/sh

#===============================================
#--Run smartpca (using program eigensoft)
#===============================================

source activate my_root

cp Fingira2500finalwithContemp.bim Fingira2500finalwithContemp.pedsnp

awk '!($6="")' Fingira2500finalwithContemp.fam > Fingira2500finalwithContempNoSex

yes 1 | head -n345 > Fingira2500finalwithContempFinalLine

paste Fingira2500finalwithContempNoSex Fingira2500finalwithContempFinalLine > Fingira2500finalwithContemp.pedind

/storage/home/ama6560/work/RindraPrograms/EIG/bin/smartpca -p /storage/home/ama6560/scratch/Malagasy/Fingira2500/Fingira2500finalwithContemp.par 