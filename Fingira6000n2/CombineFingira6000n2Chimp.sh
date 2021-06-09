#!/bin/sh

#Pick only SNPs that are represented in both samples
plink --bfile ../Fingira6000n2Only --extract  ../Fingira6000n2CombinedSNPs.txt --make-bed --out Fingira6000n2Thin

plink --bfile ../../AfricanAsianMalagasyChimp --extract  ../Fingira6000n2CombinedSNPs.txt --make-bed --out ContemporaryFingira6000n2Thin

#merge first time, gets list of SNPs whose strands may need to be flipped
plink --bfile ContemporaryFingira6000n2Thin --bmerge Fingira6000n2Thin.bed Fingira6000n2Thin.bim Fingira6000n2Thin.fam --recode --out Fingira6000n2Temp

plink --bfile Fingira6000n2Thin --flip Fingira6000n2Temp.missnp --recode --make-bed --out Fingira6000n2_flipped

plink --bfile ContemporaryFingira6000n2Thin --bmerge Fingira6000n2_flipped.bed Fingira6000n2_flipped.bim Fingira6000n2_flipped.fam --recode --out Fingira6000n2Temp2

plink --bfile ContemporaryFingira6000n2Thin --exclude Fingira6000n2Temp2.missnp --make-bed --out final_tmp3

plink --bfile Fingira6000n2_flipped --exclude Fingira6000n2Temp2.missnp --make-bed --out Fingira6000n2_flipped_tmp

plink --bfile final_tmp3 --bmerge Fingira6000n2_flipped_tmp --must-have-sex --make-bed --out Fingira6000n2finalwithChimp --chr 1-22

plink --bfile Fingira6000n2finalwithChimp --recode vcf --out Fingira6000n2ChimpforTreemix