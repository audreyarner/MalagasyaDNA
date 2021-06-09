#Pick only SNPs that are represented in both samples
plink --bfile ../Pemba1400Only --extract  ../Pemba1400CombinedSNPs.txt --make-bed --out Pemba1400Thin

plink --bfile ../../AfricanAsianMalagasyChimp --extract  ../Pemba1400CombinedSNPs.txt --make-bed --out ContemporaryPemba1400Thin

#merge first time, gets list of SNPs whose strands may need to be flipped
plink --bfile ContemporaryPemba1400Thin --bmerge Pemba1400Thin.bed Pemba1400Thin.bim Pemba1400Thin.fam --recode --out Pemba1400Temp

plink --bfile Pemba1400Thin --flip Pemba1400Temp.missnp --recode --make-bed --out Pemba1400_flipped

plink --bfile ContemporaryPemba1400Thin --bmerge Pemba1400_flipped.bed Pemba1400_flipped.bim Pemba1400_flipped.fam --must-have-sex --make-bed --out Pemba1400finalwithChimp --chr 1-22

plink --bfile Pemba1400finalwithChimp --recode vcf --out Pemba1400ChimpforTreemix
