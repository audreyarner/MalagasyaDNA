#!/usr/bin/env Rscript

library(dplyr)
#read fam file
FamFile <- read.table("Chenchereren2finalwithChimp.fam")

#make column in style needed for populations
FamFile$V7 <- paste(FamFile$V1, FamFile$V2, sep = "_")

FamFile <- FamFile %>% select(V7)

Ind <- read.table("Chenchereren2PopulationsTreemix.txt")

Mapfile <- cbind(FamFile, Ind)

write.table(Mapfile, "Chenchereren2_map.tsv", sep="\t", col.names =F, row.names = F, quote =F)
