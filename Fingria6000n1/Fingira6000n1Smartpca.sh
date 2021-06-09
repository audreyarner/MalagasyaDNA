#!/bin/sh

#===============================================
#--Run smartpca (using program eigensoft)
#===============================================

source activate my_root

cp Fingira6000n1finalwithContemp.bim Fingira6000n1finalwithContemp.pedsnp

awk '!($6="")' Fingira6000n1finalwithContemp.fam > Fingira6000n1finalwithContempNoSex

yes 1 | head -n345 > Fingira6000n1finalwithContempFinalLine

paste Fingira6000n1finalwithContempNoSex Fingira6000n1finalwithContempFinalLine > Fingira6000n1finalwithContemp.pedind

/storage/home/ama6560/work/RindraPrograms/EIG/bin/smartpca -p /storage/home/ama6560/scratch/Malagasy/Fingira6000n1/Fingira6000n1finalwithContemp.par 