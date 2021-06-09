#!/bin/sh

#Pick only SNPs that are represented in both samples
plink --bfile ../Chencherere6000n2Only --extract  ../Chencherere6000n2CombinedSNPs.txt --make-bed --out Chenchereren2Thin

plink --bfile ../../AfricanAsianMalagasyChimp --extract  ../Chencherere6000n2CombinedSNPs.txt --make-bed --out ContemporaryChenchereren2Thin

#merge first time, gets list of SNPs whose strands may need to be flipped
plink --bfile ContemporaryChenchereren2Thin --bmerge Chenchereren2Thin.bed Chenchereren2Thin.bim Chenchereren2Thin.fam --recode --out Chenchereren2Temp

plink --bfile Chenchereren2Thin --flip Chenchereren2Temp.missnp --recode --make-bed --out Chenchereren2_flipped

plink --bfile ContemporaryChenchereren2Thin --bmerge Chenchereren2_flipped.bed Chenchereren2_flipped.bim Chenchereren2_flipped.fam --must-have-sex --make-bed --out Chenchereren2finalwithChimp --chr 1-22

plink --bfile Chenchereren2finalwithChimp --recode vcf --out Chenchereren2ChimpforTreemix
