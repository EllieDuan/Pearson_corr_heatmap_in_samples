install.packages("gplots")
install.packages("RColorBrewer")
install.packages("corrplot")
library(gplots)
library(RColorBrewer)

fetus_tpm <- read.table("join_common_tile_T.txt", header = T)
row.names(fetus_tpm) <- fetus_tpm$Tile
fetus_tpm = fetus_tpm[,-1 ]


# old method
res<- cor(fetus_tpm, method = "pearson", use = "pairwise")
write.table(res, file = "pearson_corr.txt",sep = '\t')

myPalette <- colorRampPalette(rev(brewer.pal(11, "Spectral")), space="Lab")
mybreaks <- c(seq(0,0.42, length.out = 33),seq(0.43,0.6, length.out = 34),seq(0.61,1,length.out = 34))

heatmap.2(res, col=myPalette, key=T, keysize=1.5,
          breaks = mybreaks,
          density.info="none", trace="none", margin=c(7,7), 
          hclust=hclustfunc,distfun=distfunc, 
          Rowv=FALSE,Colv=FALSE, dendrogram="none",
          cexRow=0.9,cexCol = 1 )

# new method
library(corrplot)
res<- cor(fetus_tpm, method = "pearson", use = "complete.obs")
corrplot(res, method = "square", type = "lower", 
         tl.col = "black", tl.srt = 45,
         col=colorRampPalette(c("blue","white", "red"))(100), cl.lim = c(0, 1))






