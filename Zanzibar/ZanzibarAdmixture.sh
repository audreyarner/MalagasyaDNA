#!/bin/sh

#===============================================
#--Run ADMIXTURE (v1.3) on merged dataset
#===============================================

plink --bfile ZanzibarOnly --extract  ZanzibarCombinedSNPs.txt --make-bed --out ZanzibarThin

plink --bfile ../AfricanAsianMalagasy --extract  ZanzibarCombinedSNPs.txt --make-bed --out ContemporaryZanzibarThin

#merge first time, gets list of SNPs whose strands may need to be flipped
plink --bfile ContemporaryZanzibarThin --bmerge ZanzibarThin.bed ZanzibarThin.bim ZanzibarThin.fam --recode --out ZanzibarTemp

plink --bfile ZanzibarThin --flip ZanzibarTemp.missnp --recode --make-bed --out Zanzibar_flipped

plink --bfile ContemporaryZanzibarThin --bmerge Zanzibar_flipped.bed Zanzibar_flipped.bim Zanzibar_flipped.fam --recode --out ZanzibarTemp2

plink --bfile ContemporaryZanzibarThin --exclude ZanzibarTemp2.missnp --make-bed --out final_tmp3

plink --bfile Zanzibar_flipped --exclude ZanzibarTemp2.missnp --make-bed --out Zanzibar_flipped_tmp

plink --bfile final_tmp3 --bmerge Zanzibar_flipped_tmp --must-have-sex --make-bed --out ZanzibarfinalwithContemp --chr 1-22

for K in 1 2 3 4 5 6 7 8; \
	do admixture -B --cv /storage/home/ama6560/scratch/Malagasy/Zanzibar/ZanzibarfinalwithContemp.bed $K | tee Zanzibar${K}.out; done