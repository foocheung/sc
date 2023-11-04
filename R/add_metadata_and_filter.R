add_metadata_and_filter <- function(B1_US_merge, save_name) {
  mito.genes = grep(pattern = "^MT-", x = rownames(B1_US_merge), value = TRUE)
  B1_US_merge <- Seurat::AddMetaData(object = B1_US_merge, metadata = Matrix::colSums(B1_US_merge[mito.genes,])/Matrix::colSums(B1_US_merge), col.name = "percent.mito")
  B1_US_merge <- Seurat::PercentageFeatureSet(B1_US_merge, "^RP[SL]", col.name = "percent_ribo")
  B1_US_merge <- Seurat::PercentageFeatureSet(B1_US_merge, "^HB[^(P)]", col.name = "percent_hb")

  ggsave(paste0(save_name,"_prefiltering.pdf"),
         plot=Seurat::VlnPlot(B1_US_merge, c( "percent.mito","percent_ribo","percent_hb", "nFeature_RNA", "nCount_RNA"),
                      group.by = "Lane", pt.size=0, ncol = 3)) + theme(axis.text.x = element_text(angle = 45, hjust=1))

  B1_US_merge <- B1_US_merge %>%
    filter(nFeature_RNA > 200 & nFeature_RNA < 3000 & nCount_RNA < 20000 & percent.mito < 0.30 & nCount_RNA > 1000 )
   # filter(nFeature_RNA > 200 & nFeature_RNA < 3000 & nCount_RNA < 20000 )
  ggsave(paste0(save_name,"_postfiltering.pdf"),
         plot =Seurat::VlnPlot(B1_US_merge, c( "percent.mito","percent_ribo","percent_hb", "nFeature_RNA", "nCount_RNA"),
                       group.by = "Lane", pt.size=0, ncol = 3)) + theme(axis.text.x = element_text(angle = 45, hjust=1))
  return(B1_US_merge)
}

