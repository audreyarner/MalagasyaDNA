#!/bin/sh

#===============================================
#--Run smartpca (using program eigensoft)
#===============================================

source activate my_root

cp HoraHolocenen1finalwithContemp.bim HoraHolocenen1finalwithContemp.pedsnp

awk '!($6="")' HoraHolocenen1finalwithContemp.fam > HoraHolocenen1finalwithContempNoSex

yes 1 | head -n345 > HoraHolocenen1finalwithContempFinalLine

paste HoraHolocenen1finalwithContempNoSex HoraHolocenen1finalwithContempFinalLine > HoraHolocenen1finalwithContemp.pedind

/storage/home/ama6560/work/RindraPrograms/EIG/bin/smartpca -p /storage/home/ama6560/scratch/Malagasy/HoraHolocenen1/HoraHolocenen1finalwithContemp.par 