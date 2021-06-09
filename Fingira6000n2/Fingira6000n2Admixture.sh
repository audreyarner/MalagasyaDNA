#!/bin/sh

#===============================================
#--Run ADMIXTURE (v1.3) on merged dataset
#===============================================

#Pick only SNPs that are represented in both samples
plink --bfile Fingira6000n2Only --extract  Fingira6000n2CombinedSNPs.txt --make-bed --out Fingira6000n2Thin

plink --bfile ../AfricanAsianMalagasy --extract  Fingira6000n2CombinedSNPs.txt --make-bed --out ContemporaryFingira6000n2Thin

#merge first time, gets list of SNPs whose strands may need to be flipped
plink --bfile ContemporaryFingira6000n2Thin --bmerge Fingira6000n2Thin.bed Fingira6000n2Thin.bim Fingira6000n2Thin.fam --recode --out Fingira6000n2Temp

plink --bfile Fingira6000n2Thin --flip Fingira6000n2Temp.missnp --recode --make-bed --out Fingira6000n2_flipped

plink --bfile ContemporaryFingira6000n2Thin --bmerge Fingira6000n2_flipped.bed Fingira6000n2_flipped.bim Fingira6000n2_flipped.fam --recode --out Fingira6000n2Temp2

plink --bfile ContemporaryFingira6000n2Thin --exclude Fingira6000n2Temp2.missnp --make-bed --out final_tmp3

plink --bfile Fingira6000n2_flipped --exclude Fingira6000n2Temp2.missnp --make-bed --out Fingira6000n2_flipped_tmp

plink --bfile final_tmp3 --bmerge Fingira6000n2_flipped_tmp --must-have-sex --make-bed --out Fingira6000n2finalwithContemp --chr 1-22

for K in 2 3 4 5 6 7 8; \
	do admixture -B --cv /storage/home/ama6560/scratch/Malagasy/Fingira6000n2/Fingira6000n2finalwithContemp.bed $K | tee Fingira6000n2K${K}.out; done