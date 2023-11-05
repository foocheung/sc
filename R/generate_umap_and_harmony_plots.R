generate_umap_and_harmony_plots <- function(B1_US_merge, save_name, lanes) {
  B1_US_merge@meta.data$Lane <- as.factor(B1_US_merge@meta.data$Lane)
  if (length(lanes) == 1){

    ggsave(paste0(save_name,"_umap.pdf"),
    #ggsave(paste0(save_name,"_umap.png"),dpi=300,
           # png(paste0(save_name,"_umap.png", sep=""), width=1800, height=1600, res = 300)
           #    png("test2.png", width=1800, height=1600, res = 300)

           plot =Seurat::DimPlot(object = B1_US_merge, reduction = "rna.umap", pt.size = .1, split.by = "BEST.GUESS", ncol = 1))  + Seurat::NoLegend()
#    dev.off()
  } else {


    ggsave(paste0(save_name,"_harmony.pdf"),
           plot = Seurat::DimPlot(object = B1_US_merge, reduction = "rna.umap.harmony", pt.size = .1, split.by = "BEST.GUESS", ncol = 1)) + Seurat::NoLegend()
  }
}
