run_rna_harmony <- function(seur_obj) {
  # seed(1234)
  Seurat::DefaultAssay(seur_obj) <- 'RNA'
  seur_obj <- Seurat::SCTransform(seur_obj)
  seur_obj <- Seurat::RunPCA(seur_obj,reduction.name = 'pca_h',reduction.key = 'pca_h')
  seur_obj <- Seurat::FindNeighbors(seur_obj,"harmony", dims = 1:30)
  seur_obj <- Seurat::FindClusters(seur_obj, resolution = 0.8, algorithm=3, verbose = FALSE)

  seur_obj <- Seurat::RunUMAP(seur_obj, reduction = 'harmony', dims = 1:30, assay = 'RNA',
                              reduction.name = 'rna.umap.harmony', reduction.key = 'rnaUMAP.harmony_')

}
