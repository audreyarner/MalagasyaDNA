#Pick only SNPs that are represented in both samples
plink --bfile ../ZanzibarOnly --extract  ../ZanzibarCombinedSNPs.txt --make-bed --out ZanzibarThin

plink --bfile ../../AfricanAsianMalagasyChimp --extract  ../ZanzibarCombinedSNPs.txt --make-bed --out ContemporaryZanzibarThin

#merge first time, gets list of SNPs whose strands may need to be flipped
plink --bfile ContemporaryZanzibarThin --bmerge 1ZanzibarThin.bed ZanzibarThin.bim ZanzibarThin.fam --recode --out ZanzibarTemp

plink --bfile ZanzibarThin --flip ZanzibarTemp.missnp --recode --make-bed --out Zanzibar_flipped

plink --bfile ContemporaryZanzibarThin --bmerge Zanzibar_flipped.bed Zanzibar_flipped.bim Zanzibar_flipped.fam --recode --out ZanzibarTemp2

plink --bfile ContemporaryZanzibarThin --exclude ZanzibarTemp2.missnp --make-bed --out final_tmp3

plink --bfile Zanzibar_flipped --exclude ZanzibarTemp2.missnp --make-bed --out Zanzibar_flipped_tmp

plink --bfile final_tmp3 --bmerge Zanzibar_flipped_tmp --must-have-sex --make-bed --out ZanzibarfinalwithChimp --chr 1-22

plink --bfile ZanzibarfinalwithChimp --recode vcf --out ZanzibarChimpforTreemix
