#Pick only SNPs that are represented in both samples
plink --bfile ../KenyaOnly --extract  ../KenyaCombinedSNPs.txt --make-bed --out KenyaThin

plink --bfile ../../AfricanAsianMalagasyChimp --extract  ../KenyaCombinedSNPs.txt --make-bed --out ContemporaryKenyaThin

#merge first time, gets list of SNPs whose strands may need to be flipped
plink --bfile ContemporaryKenyaThin --bmerge KenyaThin.bed KenyaThin.bim KenyaThin.fam --recode --out KenyaTemp

plink --bfile KenyaThin --flip KenyaTemp.missnp --recode --make-bed --out Kenya_flipped

plink --bfile ContemporaryKenyaThin --bmerge Kenya_flipped.bed Kenya_flipped.bim Kenya_flipped.fam --must-have-sex --make-bed --out KenyafinalwithChimp --chr 1-22

plink --bfile KenyafinalwithChimp --recode vcf --out KenyaChimpforTreemix
