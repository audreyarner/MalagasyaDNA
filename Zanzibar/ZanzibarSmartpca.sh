#!/bin/sh

#===============================================
#--Run smartpca (using program eigensoft)
#===============================================

#this run will not have any outlier removal iterations
module load anaconda3

source activate my_root

cp ZanzibarfinalwithContemp.bim ZanzibarfinalwithContemp.pedsnp

awk '!($6="")' ZanzibarfinalwithContemp.fam > ZanzibarfinalwithContempNoSex

paste ZanzibarfinalwithContempNoSex ZanzibarfinalwithContempFinalLine > ZanzibarfinalwithContemp.pedind

/storage/home/ama6560/work/RindraPrograms/EIG/bin/smartpca -p /storage/home/ama6560/scratch/Malagasy/Zanzibar/ZanzibarfinalwithContemp.par 