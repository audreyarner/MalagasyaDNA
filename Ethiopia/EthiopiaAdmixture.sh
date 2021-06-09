#!/bin/sh

#===============================================
#--Run ADMIXTURE (v1.3) on merged dataset
#===============================================

plink --bfile EthiopiaOnly --extract  EthiopiaCombinedSNPs.txt --make-bed --out EthiopiaThin

plink --bfile ../AfricanAsianMalagasy --extract  EthiopiaCombinedSNPs.txt --make-bed --out ContemporaryEthiopiaThin

#merge first time, gets list of SNPs whose strands may need to be flipped
plink --bfile ContemporaryEthiopiaThin --bmerge EthiopiaThin.bed EthiopiaThin.bim EthiopiaThin.fam --recode --out EthiopiaTemp

plink --bfile EthiopiaThin --flip EthiopiaTemp.missnp --recode --make-bed --out Ethiopia_flipped

plink --bfile ContemporaryEthiopiaThin --bmerge Ethiopia_flipped.bed Ethiopia_flipped.bim Ethiopia_flipped.fam --recode --out EthiopiaTemp2

plink --bfile ContemporaryEthiopiaThin --exclude EthiopiaTemp2.missnp --make-bed --out final_tmp3

plink --bfile Ethiopia_flipped --exclude EthiopiaTemp2.missnp --make-bed --out Ethiopia_flipped_tmp

plink --bfile final_tmp3 --bmerge Ethiopia_flipped_tmp --must-have-sex --make-bed --out EthiopiafinalwithContemp --chr 1-22

for K in 2 3 4 5 6 7 8; \
	do admixture -B --cv /storage/home/ama6560/scratch/Malagasy/Ethiopia/EthiopiafinalwithContemp.bed $K | tee Ethiopia${K}.out; done