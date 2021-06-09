#!/bin/sh

#===============================================
#--Run smartpca (using program eigensoft)
#===============================================

source activate my_root

cp Fingira6000n2finalwithContemp.bim Fingira6000n2finalwithContemp.pedsnp

awk '!($6="")' Fingira6000n2finalwithContemp.fam > Fingira6000n2finalwithContempNoSex

yes 1 | head -n345 > Fingira6000n2finalwithContempFinalLine

paste Fingira6000n2finalwithContempNoSex Fingira6000n2finalwithContempFinalLine > Fingira6000n2finalwithContemp.pedind

/storage/home/ama6560/work/RindraPrograms/EIG/bin/smartpca -p /storage/home/ama6560/scratch/Malagasy/Fingira6000n2/Fingira6000n2finalwithContemp.par 