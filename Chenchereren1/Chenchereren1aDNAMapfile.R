#!/usr/bin/env Rscript

library(dplyr)
#read fam file
FamFile <- read.table("Chenchereren1finalwithChimp.fam")

#make column in style needed for populations
FamFile$V7 <- paste(FamFile$V1, FamFile$V2, sep = "_")

FamFile <- FamFile %>% select(V7)

Ind <- read.table("Chenchereren1PopulationsTreemix.txt")

Mapfile <- cbind(FamFile, Ind)

write.table(Mapfile, "Chenchereren1_map.tsv", sep="\t", col.names =F, row.names = F, quote =F)
