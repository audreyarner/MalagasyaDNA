#!/usr/bin/env Rscript

library(dplyr)
#read fam file
FamFile <- read.table("KenyafinalwithChimp.fam")

#make column in style needed for populations
FamFile$V7 <- paste(FamFile$V1, FamFile$V2, sep = "_")

FamFile <- FamFile %>% select(V7)

Ind <- read.table("KenyaPopulationsTreemix.txt")

Mapfile <- cbind(FamFile, Ind)

write.table(Mapfile, "Kenya_map.tsv", sep="\t", col.names =F, row.names = F, quote =F)
