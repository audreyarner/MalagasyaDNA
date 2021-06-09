#!/bin/sh

#Pick only SNPs that are represented in both samples
plink --bfile ../Fingira2500Only --extract  ../Fingira2500CombinedSNPs.txt --make-bed --out Fingira2500Thin

plink --bfile ../../AfricanAsianMalagasyChimp --extract  ../Fingira2500CombinedSNPs.txt --make-bed --out ContemporaryFingira2500Thin

#merge first time, gets list of SNPs whose strands may need to be flipped
plink --bfile ContemporaryFingira2500Thin --bmerge Fingira2500Thin.bed Fingira2500Thin.bim Fingira2500Thin.fam --recode --out Fingira2500Temp

plink --bfile Fingira2500Thin --flip Fingira2500Temp.missnp --recode --make-bed --out Fingira2500_flipped

plink --bfile ContemporaryFingira2500Thin --bmerge Fingira2500_flipped.bed Fingira2500_flipped.bim Fingira2500_flipped.fam --recode --out Fingira2500Temp2

plink --bfile ContemporaryFingira2500Thin --exclude Fingira2500Temp2.missnp --make-bed --out final_tmp3

plink --bfile Fingira2500_flipped --exclude Fingira2500Temp2.missnp --make-bed --out Fingira2500_flipped_tmp

plink --bfile final_tmp3 --bmerge Fingira2500_flipped_tmp --must-have-sex --make-bed --out Fingira2500finalwithChimp --chr 1-22

plink --bfile Fingira2500finalwithChimp --recode vcf --out Fingira2500ChimpforTreemix