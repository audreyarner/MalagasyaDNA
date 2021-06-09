#!/bin/sh

#===============================================
#--Run ADMIXTURE (v1.3) on merged dataset
#===============================================

plink --bfile Pemba1400Only --extract  Pemba1400CombinedSNPs.txt --make-bed --out Pemba1400Thin

plink --bfile ../AfricanAsianMalagasy --extract  Pemba1400CombinedSNPs.txt --make-bed --out ContemporaryPemba1400Thin

#merge first time, gets list of SNPs whose strands may need to be flipped
plink --bfile ContemporaryPemba1400Thin --bmerge Pemba1400Thin.bed Pemba1400Thin.bim Pemba1400Thin.fam --recode --out Pemba1400Temp

plink --bfile Pemba1400Thin --flip Pemba1400Temp.missnp --recode --make-bed --out Pemba1400_flipped

plink --bfile ContemporaryPemba1400Thin --bmerge Pemba1400_flipped.bed Pemba1400_flipped.bim Pemba1400_flipped.fam --recode --out Pemba1400Temp2

plink --bfile ContemporaryPemba1400Thin --exclude Pemba1400Temp2.missnp --make-bed --out final_tmp3

plink --bfile Pemba1400_flipped --exclude Pemba1400Temp2.missnp --make-bed --out Pemba1400_flipped_tmp

plink --bfile final_tmp3 --bmerge Pemba1400_flipped_tmp --must-have-sex --make-bed --out Pemba1400finalwithContemp --chr 1-22

for K in 1 2 3 4 5 6 7 8; \
	do admixture -B --cv /storage/home/ama6560/scratch/Malagasy/Pemba1400/Pemba1400finalwithContemp.bed $K | tee Pemba1400${K}.out; done