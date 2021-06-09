#!/bin/sh

#Pick only SNPs that are represented in both samples
plink --bfile ../Pemba700Only --extract  ../Pemba700CombinedSNPs.txt --make-bed --out Pemba700Thin

plink --bfile ../../AfricanAsianMalagasyChimp --extract  ../Pemba700CombinedSNPs.txt --make-bed --out ContemporaryPemba700Thin

#merge first time, gets list of SNPs whose strands may need to be flipped
plink --bfile ContemporaryPemba700Thin --bmerge Pemba700Thin.bed Pemba700Thin.bim Pemba700Thin.fam --recode --out Pemba700Temp

plink --bfile Pemba700Thin --flip Pemba700Temp.missnp --recode --make-bed --out Pemba700_flipped

plink --bfile ContemporaryPemba700Thin --bmerge Pemba700_flipped.bed Pemba700_flipped.bim Pemba700_flipped.fam --recode --out Pemba700Temp2

plink --bfile ContemporaryPemba700Thin --exclude Pemba700Temp2.missnp --make-bed --out final_tmp3

plink --bfile Pemba700_flipped --exclude Pemba700Temp2.missnp --make-bed --out Pemba700_flipped_tmp

plink --bfile final_tmp3 --bmerge Pemba700_flipped_tmp --must-have-sex --make-bed --out Pemba700finalwithChimp --chr 1-22

plink --bfile Pemba700finalwithChimp --recode vcf --out Pemba700ChimpforTreemix