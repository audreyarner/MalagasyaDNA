#!/bin/sh

#===============================================
#--Run ADMIXTURE (v1.3) on merged dataset
#===============================================

plink --bfile Pemba700Only --extract  Pemba700CombinedSNPs.txt --make-bed --out Pemba700Thin

plink --bfile ../AfricanAsianMalagasy --extract  Pemba700CombinedSNPs.txt --make-bed --out ContemporaryPemba700Thin

#merge first time, gets list of SNPs whose strands may need to be flipped
plink --bfile ContemporaryPemba700Thin --bmerge Pemba700Thin.bed Pemba700Thin.bim Pemba700Thin.fam --recode --out Pemba700Temp

plink --bfile Pemba700Thin --flip Pemba700Temp.missnp --recode --make-bed --out Pemba700_flipped

plink --bfile ContemporaryPemba700Thin --bmerge Pemba700_flipped.bed Pemba700_flipped.bim Pemba700_flipped.fam --recode --out Pemba700Temp2

plink --bfile ContemporaryPemba700Thin --exclude Pemba700Temp2.missnp --make-bed --out final_tmp3

plink --bfile Pemba700_flipped --exclude Pemba700Temp2.missnp --make-bed --out Pemba700_flipped_tmp

plink --bfile final_tmp3 --bmerge Pemba700_flipped_tmp --must-have-sex --make-bed --out Pemba700finalwithContemp --chr 1-22

for K in 2 3 4 5 6 7 8; \
	do admixture -B --cv /storage/home/ama6560/scratch/Malagasy/Pemba700/Pemba700finalwithContemp.bed $K | tee Pemba700${K}.out; done