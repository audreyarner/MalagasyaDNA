#!/usr/bin/env Rscript

#===================================================================================
#--t-test for proportion of aDNA ancestry to African ancestry in Malagasy samples 
#===================================================================================

library(dplyr)

#function to identify the proportion of African hunter-gatherer aDNA in Malagasy and Bakiga samples
getaDNAProportion = function(FamilyFile, Populations, Q3, Q6){
  FamFile <- read.table(FamilyFile)
  PopName <- gsub("finalwithContemp.fam", "", FamilyFile)
  
  Pops <- read.table(Populations)
  names(Pops)[1] <- "pops"
  
  #ADMIXTURE K=3 had the lowest cross-validation error
  AdmixProportions3 <- read.table(Q3)
  
  Admix3<-cbind(FamFile$V2, Pops, AdmixProportions3)
  
  #make Admixture plot
  pdf(file=paste(PopName, "Admixture3.pdf", sep=""), width = 30, height = 10)
  barplot(t(as.matrix(admix3[,3:5])), col=rainbow(3), ylab = "Ancestry", border=NA, names.arg=admix6$pop, las=2, cex.names=0.5, main = "Chenchereren1 aDNA K2")
  dev.off()
  
  #######
  #aDNA ancestry comes out by itself at K=6
  AdmixProportions6 <- read.table(Q6)
  
  Admix6<-cbind(FamFile$V2, Pops, Admix2)
  
  #admixture plot for K=6
  pdf(file=paste(PopName,"Admixture6.pdf", sep=""), width = 30, height = 10)
  barplot(t(as.matrix(admix6[,3:8])), col=rainbow(6), ylab = "Ancestry", border=NA, names.arg=admix6$pop, las=2, cex.names=0.5, main = "Chenchereren1 aDNA K2")
  dev.off()
  
  #-----------------------------------------------------------
  #select value representing aDNA ancestry at K=6
  ProportionaDNA <- Admix6 %>% select(pops, V1)
  names(ProportionaDNA)[2] <- "aDNAPercent"
  
  #select value representing African ancestry at K=3
  ProportionKiga <- Admix3 %>% select(V1)
  names(ProportionKiga)[1] <- "AfricanPercent"
  
  ProportionCalc <- cbind(ProportionaDNA,ProportionKiga)
  
  #identify the proportion of aDNA ancestry to african ancestry
  ProportionCalc <- mutate(ProportionCalc, Proportion = aDNAPercent/AfricanPercent)
  
  NotNeeded <- c("Druze", "Borneo", "Kiga", "Chenchereren1_aDNA")
  
  #select only Malagasy samples to compute proportion and t-test
  Malagasy <- ProportionCalc %>% filter(!(pops %in% NotNeeded))
  print(paste(PopName, "Malagasy average aDNA proprtion is", mean(Malagasy$aDNAPercent)))
  print(paste(PopName, "Malagasy average African proprtion is", mean(Malagasy$AfricanPercent)))
  print(paste(PopName, "Malagasy average aDNA/African proprtion is", mean(Malagasy$Proportion)))
  
  #select only Bakiga samples to compute proportion and t-test
  African <- ProportionCalc %>% filter(pops=="Kiga")
  print(paste(PopName, "Kiga average aDNA proprtion is", mean(African$aDNAPercent)))
  print(paste(PopName, "Kiga average African proprtion is", mean(African$AfricanPercent)))
  print(paste(PopName, "Kiga average aDNA/African proprtion is", mean(African$Proportion)))
  
  #t-test 
  Test <- t.test(Malagasy$Proportion, African$Proportion)
  print(Test)
  
  Both <- rbind(Malagasy,African)
  
  write.table(Both, file=paste(PopName,"ProportionTable.txt", sep=""), row.names=F, quote =F)
}  

getaDNAProportion("Chenchereren1finalwithContemp.fam", "Chenchereren1Populations.txt", "Chenchereren1finalwithContemp.3.Q", "Chenchereren1finalwithContemp.6.Q")
getaDNAProportion("Chenchereren2finalwithContemp.fam", "Chenchereren2Populations.txt", "Chenchereren2finalwithContemp.3.Q", "Chenchereren2finalwithContemp.6.Q")
getaDNAProportion("EthiopiafinalwithContemp.fam", "EthiopiaPopulations.txt", "EthiopiafinalwithContemp.3.Q", "EthiopiafinalwithContemp.6.Q")
getaDNAProportion("Fingira2500finalwithContemp.fam", "Fingira2500Populations.txt", "Fingira2500finalwithContemp.3.Q", "Fingira2500finalwithContemp.6.Q")
getaDNAProportion("Fingira6000n1finalwithContemp.fam", "Fingira6000n1Populations.txt", "Fingira6000n1finalwithContemp.3.Q", "Fingira6000n1finalwithContemp.6.Q")
getaDNAProportion("Fingira6000n2finalwithContemp.fam", "Fingira6000n2Populations.txt", "Fingira6000n2finalwithContemp.3.Q", "Fingira6000n2finalwithContemp.6.Q")
getaDNAProportion("HoraHolocenen1finalwithContemp.fam", "HoraHolocenen1Populations.txt", "HoraHolocenen1finalwithContemp.3.Q", "HoraHolocenen1finalwithContemp.6.Q")
getaDNAProportion("HoraHolocenen2finalwithContemp.fam", "HoraHolocenen2Populations.txt", "HoraHolocenen2finalwithContemp.3.Q", "HoraHolocenen2finalwithContemp.6.Q")
getaDNAProportion("Pemba700finalwithContemp.fam", "Pemba700Populations.txt", "Pemba700finalwithContemp.3.Q", "Pemba700finalwithContemp.6.Q")
getaDNAProportion("KenyafinalwithContemp.fam", "KenyaPopulations.txt", "KenyafinalwithContemp.3.Q", "KenyafinalwithContemp.6.Q")
getaDNAProportion("Pemba1400finalwithContemp.fam", "Pemba1400Populations.txt", "Pemba1400finalwithContemp.3.Q", "Pemba1400finalwithContemp.6.Q")
getaDNAProportion("ZanzibarfinalwithContemp.fam", "ZanzibarPopulations.txt", "ZanzibarfinalwithContemp.3.Q", "ZanzibarfinalwithContemp.6.Q")
