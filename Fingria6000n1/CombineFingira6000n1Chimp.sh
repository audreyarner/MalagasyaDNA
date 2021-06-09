#Pick only SNPs that are represented in both samples
plink --bfile ../Fingira6000n1Only --extract  ../Fingira6000n1CombinedSNPs.txt --make-bed --out Fingira6000n1Thin

plink --bfile ../../AfricanAsianMalagasyChimp --extract  ../Fingira6000n1CombinedSNPs.txt --make-bed --out ContemporaryFingira6000n1Thin

#merge first time, gets list of SNPs whose strands may need to be flipped
plink --bfile ContemporaryFingira6000n1Thin --bmerge Fingira6000n1Thin.bed Fingira6000n1Thin.bim Fingira6000n1Thin.fam --recode --out Fingira6000n1Temp

plink --bfile Fingira6000n1Thin --flip Fingira6000n1Temp.missnp --recode --make-bed --out Fingira6000n1_flipped

plink --bfile ContemporaryFingira6000n1Thin --bmerge Fingira6000n1_flipped.bed Fingira6000n1_flipped.bim Fingira6000n1_flipped.fam --must-have-sex --make-bed --out Fingira6000n1finalwithChimp --chr 1-22

plink --bfile Fingira6000n1finalwithChimp --recode vcf --out Fingira6000n1ChimpforTreemix
