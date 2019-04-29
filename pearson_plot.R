install.packages("gplots")
library(gplots)
library(RColorBrewer)

fetus_tpm <- read.table("total_join_tile_TileName.txt", header = T)

# use heat map to get the correlation plot 
row.names(fetus_tpm) <- fetus_tpm$Tile
fetus_tpm = fetus_tpm[,-1 ]
res<- cor(fetus_tpm, method = "pearson", use = "complete.obs")
write.table(res, file = "pearson_corr.txt",sep = '\t')

myPalette <- colorRampPalette(rev(brewer.pal(11, "Spectral")), space="Lab")
mybreaks <- c(seq(0,0.2, length.out = 33),seq(0.21,0.5, length.out = 34),seq(0.51,1,length.out = 34))

heatmap.2(res, col=myPalette, key=T, keysize=1.5,
          breaks = mybreaks,
          density.info="none", trace="none", margin=c(7,7), 
          hclust=hclustfunc,distfun=distfunc, 
          Rowv=FALSE,Colv=FALSE, dendrogram="none",
          cexRow=0.9,cexCol = 1 )




