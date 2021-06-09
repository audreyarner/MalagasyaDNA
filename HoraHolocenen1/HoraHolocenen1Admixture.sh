#!/bin/sh

#===============================================
#--Run ADMIXTURE (v1.3) on merged dataset
#===============================================

plink --bfile HoraHolocene1Only --extract  HoraHolocene1CombinedSNPs.txt --make-bed --out HoraHolocenen1Thin

plink --bfile ../AfricanAsianMalagasy --extract  HoraHolocene1CombinedSNPs.txt --make-bed --out ContemporaryHoraHolocenen1Thin

#merge first time, gets list of SNPs whose strands may need to be flipped
plink --bfile ContemporaryHoraHolocenen1Thin --bmerge HoraHolocenen1Thin.bed HoraHolocenen1Thin.bim HoraHolocenen1Thin.fam --recode --out HoraHolocenen1Temp

plink --bfile HoraHolocenen1Thin --flip HoraHolocenen1Temp.missnp --recode --make-bed --out HoraHolocenen1_flipped

plink --bfile ContemporaryHoraHolocenen1Thin --bmerge HoraHolocenen1_flipped.bed HoraHolocenen1_flipped.bim HoraHolocenen1_flipped.fam --recode --out HoraHolocenen1Temp2

plink --bfile ContemporaryHoraHolocenen1Thin --exclude HoraHolocenen1Temp2.missnp --make-bed --out final_tmp3

plink --bfile HoraHolocenen1_flipped --exclude HoraHolocenen1Temp2.missnp --make-bed --out HoraHolocenen1_flipped_tmp

plink --bfile final_tmp3 --bmerge HoraHolocenen1_flipped_tmp --must-have-sex --make-bed --out HoraHolocenen1finalwithContemp --chr 1-22

for K in 2 3 4 5 6 7 8; \
	do admixture -B --cv /storage/home/ama6560/scratch/Malagasy/HoraHolocene1/HoraHolocenen1finalwithContemp.bed $K | tee HoraHolocenen1${K}.out; done