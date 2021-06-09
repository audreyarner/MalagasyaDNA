#!/bin/sh

#===============================================
#--Run smartpca (using program eigensoft)
#===============================================

source activate my_root

cp Chenchereren2finalwithContemp.bim Chenchereren2finalwithContemp.pedsnp

awk '!($6="")' Chenchereren2finalwithContemp.fam > Chenchereren2finalwithContempNoSex

yes 1 | head -n345 > Chenchereren2finalwithContempFinalLine

paste Chenchereren2finalwithContempNoSex Chenchereren2finalwithContempFinalLine > Chenchereren2finalwithContemp.pedind

/storage/home/ama6560/work/RindraPrograms/EIG/bin/smartpca -p /storage/home/ama6560/scratch/Malagasy/Chenchereren2/Chenchereren2finalwithContemp.par 