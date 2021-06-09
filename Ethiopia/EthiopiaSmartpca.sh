#!/bin/sh

#===============================================
#--Run smartpca (using program eigensoft)
#===============================================

source activate my_root

cp EthiopiafinalwithContemp.bim EthiopiafinalwithContemp.pedsnp

awk '!($6="")' EthiopiafinalwithContemp.fam > EthiopiafinalwithContempNoSex

yes 1 | head -n345 > EthiopiafinalwithContempFinalLine

paste EthiopiafinalwithContempNoSex EthiopiafinalwithContempFinalLine > EthiopiafinalwithContemp.pedind

/storage/home/ama6560/work/RindraPrograms/EIG/bin/smartpca -p /storage/home/ama6560/scratch/Malagasy/Ethiopia/EthiopiafinalwithContemp.par 