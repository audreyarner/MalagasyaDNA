#!/bin/sh

#Pick only SNPs that are represented in both samples
plink --bfile ../Chencherere6000n1Only --extract  ../Chencherere6000n1CombinedSNPs.txt --make-bed --out Chenchereren1Thin

plink --bfile ../../AfricanAsianMalagasyChimp --extract  ../Chencherere6000n1CombinedSNPs.txt --make-bed --out ContemporaryChenchereren1Thin

#merge first time, gets list of SNPs whose strands may need to be flipped
plink --bfile ContemporaryChenchereren1Thin --bmerge Chenchereren1Thin.bed Chenchereren1Thin.bim Chenchereren1Thin.fam --recode --out Chenchereren1Temp

plink --bfile Chenchereren1Thin --flip Chenchereren1Temp.missnp --recode --make-bed --out Chenchereren1_flipped

plink --bfile ContemporaryChenchereren1Thin --bmerge Chenchereren1_flipped.bed Chenchereren1_flipped.bim Chenchereren1_flipped.fam --must-have-sex --make-bed --out Chenchereren1finalwithChimp --chr 1-22

plink --bfile Chenchereren1finalwithChimp --recode vcf --out Chenchereren1ChimpforTreemix