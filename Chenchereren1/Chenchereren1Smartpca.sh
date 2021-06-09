#!/bin/sh

#===============================================
#--Run smartpca (using program eigensoft)
#===============================================

source activate my_root

cp Chenchereren1finalwithContemp.bim Chenchereren1finalwithContemp.pedsnp

awk '!($6="")' Chenchereren1finalwithContemp.fam > Chenchereren1finalwithContempNoSex

yes 1 | head -n345 > Chenchereren1finalwithContempFinalLine

paste Chenchereren1finalwithContempNoSex Chenchereren1finalwithContempFinalLine > Chenchereren1finalwithContemp.pedind

/storage/home/ama6560/work/RindraPrograms/EIG/bin/smartpca -p /storage/home/ama6560/scratch/Malagasy/Chenchereren1/Chenchereren1finalwithContemp.par 