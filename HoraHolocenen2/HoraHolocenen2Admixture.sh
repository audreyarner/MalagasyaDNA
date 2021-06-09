#!/bin/sh

#===============================================
#--Run ADMIXTURE (v1.3) on merged dataset
#===============================================

plink --bfile HoraHolocene2Only --extract  HoraHolocene2CombinedSNPs.txt --make-bed --out HoraHolocenen2Thin

plink --bfile ../AfricanAsianMalagasy --extract  HoraHolocene2CombinedSNPs.txt --make-bed --out ContemporaryHoraHolocenen2Thin

#merge first time, gets list of SNPs whose strands may need to be flipped
plink --bfile ContemporaryHoraHolocenen2Thin --bmerge HoraHolocenen2Thin.bed HoraHolocenen2Thin.bim HoraHolocenen2Thin.fam --recode --out HoraHolocenen2Temp

plink --bfile HoraHolocenen2Thin --flip HoraHolocenen2Temp.missnp --recode --make-bed --out HoraHolocenen2_flipped

plink --bfile ContemporaryHoraHolocenen2Thin --bmerge HoraHolocenen2_flipped.bed HoraHolocenen2_flipped.bim HoraHolocenen2_flipped.fam --must-have-sex --make-bed --out HoraHolocenen2finalwithContemp --chr 1-22

for K in 2 3 4 5 6 7 8; \
	do admixture -B --cv /storage/home/ama6560/scratch/Malagasy/HoraHolocene2/HoraHolocenen2finalwithContemp.bed $K | tee HoraHolocenen2${K}.out; done