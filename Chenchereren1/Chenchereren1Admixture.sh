#!/bin/sh

#===============================================
#--Run ADMIXTURE (v1.3) on merged dataset
#===============================================

plink --bfile Chencherere6000n1Only --extract  Chencherere6000n1CombinedSNPs.txt --make-bed --out Chenchereren1Thin

plink --bfile ../AfricanAsianMalagasy --extract  Chencherere6000n1CombinedSNPs.txt --make-bed --out ContemporaryChenchereren1Thin

#merge first time, gets list of SNPs whose strands may need to be flipped
plink --bfile ContemporaryChenchereren1Thin --bmerge Chenchereren1Thin.bed Chenchereren1Thin.bim Chenchereren1Thin.fam --recode --out Chenchereren1Temp

plink --bfile Chenchereren1Thin --flip Chenchereren1Temp.missnp --recode --make-bed --out Chenchereren1_flipped

plink --bfile ContemporaryChenchereren1Thin --bmerge Chenchereren1_flipped.bed Chenchereren1_flipped.bim Chenchereren1_flipped.fam --must-have-sex --make-bed --out Chenchereren1finalwithContemp --chr 1-22

for K in 2 3 4 5 6 7 8; \
	do admixture -B --cv /storage/home/ama6560/scratch/Malagasy/Chenchereren1/Chenchereren1finalwithContemp.bed $K | tee Chenchereren1${K}.out; done