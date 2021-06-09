#Pick only SNPs that are represented in both samples
plink --bfile ../HoraHolocene2Only --extract  ../HoraHolocene2CombinedSNPs.txt --make-bed --out HoraHolocenen2Thin

plink --bfile ../../AfricanAsianMalagasyChimp --extract  ../HoraHolocene2CombinedSNPs.txt --make-bed --out ContemporaryHoraHolocenen2Thin

#merge first time, gets list of SNPs whose strands may need to be flipped
plink --bfile ContemporaryHoraHolocenen2Thin --bmerge HoraHolocenen2Thin.bed HoraHolocenen2Thin.bim HoraHolocenen2Thin.fam --recode --out HoraHolocenen2Temp

plink --bfile HoraHolocenen2Thin --flip HoraHolocenen2Temp.missnp --recode --make-bed --out HoraHolocenen2_flipped

plink --bfile ContemporaryHoraHolocenen2Thin --bmerge HoraHolocenen2_flipped.bed HoraHolocenen2_flipped.bim HoraHolocenen2_flipped.fam --must-have-sex --make-bed --out HoraHolocenen2finalwithChimp --chr 1-22

plink --bfile HoraHolocenen2finalwithChimp --recode vcf --out HoraHolocenen2ChimpforTreemix
