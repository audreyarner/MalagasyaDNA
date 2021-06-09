#!/bin/sh

#===============================================
#--Run smartpca (using program eigensoft)
#===============================================

source activate my_root

cp KenyafinalwithContemp.bim KenyafinalwithContemp.pedsnp

awk '!($6="")' KenyafinalwithContemp.fam > KenyafinalwithContempNoSex

yes 1 | head -n345 > KenyafinalwithContempFinalLine

paste KenyafinalwithContempNoSex KenyafinalwithContempFinalLine > KenyafinalwithContemp.pedind

/storage/home/ama6560/work/RindraPrograms/EIG/bin/smartpca -p /storage/home/ama6560/scratch/Malagasy/Kenya/KenyafinalwithContemp.par 