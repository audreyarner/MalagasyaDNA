#!/bin/sh

#===============================================
#--Run ADMIXTURE (v1.3) on merged dataset
#===============================================

plink --bfile KenyaOnly --extract  KenyaCombinedSNPs.txt --make-bed --out KenyaThin

plink --bfile ../AfricanAsianMalagasy --extract  KenyaCombinedSNPs.txt --make-bed --out ContemporaryKenyaThin

#merge first time, gets list of SNPs whose strands may need to be flipped
plink --bfile ContemporaryKenyaThin --bmerge KenyaThin.bed KenyaThin.bim KenyaThin.fam --recode --out KenyaTemp

plink --bfile KenyaThin --flip KenyaTemp.missnp --recode --make-bed --out Kenya_flipped

plink --bfile ContemporaryKenyaThin --bmerge Kenya_flipped.bed Kenya_flipped.bim Kenya_flipped.fam --must-have-sex --make-bed --out KenyafinalwithContemp --chr 1-22

for K in 2 3 4 5 6 7 8; \
	do admixture -B --cv /storage/home/ama6560/scratch/Malagasy/Kenya/KenyafinalwithContemp.bed $K | tee Kenya${K}.out; done