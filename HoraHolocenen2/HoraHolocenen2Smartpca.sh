#!/bin/sh

#===============================================
#--Run smartpca (using program eigensoft)
#===============================================

source activate my_root

cp HoraHolocenen2finalwithContemp.bim HoraHolocenen2finalwithContemp.pedsnp

awk '!($6="")' HoraHolocenen2finalwithContemp.fam > HoraHolocenen2finalwithContempNoSex

yes 1 | head -n345 > HoraHolocenen2finalwithContempFinalLine

paste HoraHolocenen2finalwithContempNoSex HoraHolocenen2finalwithContempFinalLine > HoraHolocenen2finalwithContemp.pedind

/storage/home/ama6560/work/RindraPrograms/EIG/bin/smartpca -p /storage/home/ama6560/scratch/Malagasy/HoraHolocenen2/HoraHolocenen2finalwithContemp.par 