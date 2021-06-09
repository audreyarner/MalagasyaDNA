#!/bin/sh

#===============================================
#--Run ADMIXTURE (v1.3) on merged dataset
#===============================================

plink --bfile Chencherere6000n2Only --extract  Chencherere6000n2CombinedSNPs.txt --make-bed --out Chenchereren2Thin

plink --bfile ../AfricanAsianMalagasy --extract  Chencherere6000n2CombinedSNPs.txt --make-bed --out ContemporaryChenchereren2Thin

#merge first time, gets list of SNPs whose strands may need to be flipped
plink --bfile ContemporaryChenchereren2Thin --bmerge 1Chenchereren2Thin.bed Chenchereren2Thin.bim Chenchereren2Thin.fam --recode --out Chenchereren2Temp

plink --bfile Chenchereren2Thin --flip Chenchereren2Temp.missnp --recode --make-bed --out Chenchereren2_flipped

plink --bfile ContemporaryChenchereren2Thin --bmerge Chenchereren2_flipped.bed Chenchereren2_flipped.bim Chenchereren2_flipped.fam --must-have-sex --make-bed --out Chenchereren2finalwithContemp --chr 1-22

for K in 2 3 4 5 6 7 8; \
	do admixture -B --cv /storage/home/ama6560/scratch/Malagasy/Chenchereren2/Chenchereren2finalwithContemp.bed $K | tee Chenchereren2${K}.out; done