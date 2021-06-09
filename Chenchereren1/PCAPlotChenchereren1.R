#!/usr/bin/env Rscript

#=========================================================================
#--This script creates a PCA plot from the output of smartpca
#=========================================================================

library(ggplot2)

MalagasyPCA <- read.table("Chenchereren1finalwithContemp.evec", col.names=c("Sample", "PC1", "PC2", "PC3", "PC4", "PC5","PC6", "PC7", "PC8", "PC9", "PC10", "Misc"))

Populations <- read.table("Chenchereren1Populations.txt")

names(Populations)[1] <- "Pop"

MalagasyPCA <- cbind(MalagasyPCA, Populations)

plot <- ggplot(MalagasyPCA, aes(x=PC1, y=PC2))+
  geom_point(aes(color=Pop, shape = Pop)) +
  scale_shape_manual(values = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,17))
plot

ggsave(plot, file="Chenchereren1PCAPlot.pdf", height=12, width=12)