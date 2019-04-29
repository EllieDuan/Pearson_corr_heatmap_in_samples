install.packages("gplots")
library(gplots)
library(RColorBrewer)

##### counts of CpG on Chr
gene_list <- read.table("chr_counts_total.txt", header = T)
row.names(gene_list) <- gene_list$chr
gene_list <- gene_list[,2:36] #### need to change based on samples
data <- log10(gene_list)

myPalette <- colorRampPalette(rev(brewer.pal(11, "Spectral")), space="Lab")
heatmap.2(as.matrix(data),
          density.info="none",  
          trace="none",         
          margins =c(6,6),    
          col= myPalette(100),       
          dendrogram='none',     
          Rowv=FALSE,
          Colv=FALSE)

##### avg methylation level in each chr
gene_list <- read.table("avg_meCpg_Chr.txt", header = T)
row.names(gene_list) <- gene_list$chr
gene_list <- gene_list[,2:36] #### need to change based on samples
table <- gene_list*100
mybreaks <- c(seq(15,30, length.out = 33),seq(31,39, length.out = 34),seq(40,70,length.out = 34))
heatmap.2(as.matrix(table),
          density.info="none",  
          trace="none",         
          margins =c(6,6),    
          col= myPalette(100), 
          breaks = mybreaks,
          dendrogram='none',     
          Rowv=FALSE,
          Colv=FALSE)

