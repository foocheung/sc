run_cite <-function(seur_obj) {
  #seed(1234)
  Seurat::DefaultAssay(seur_obj) <- 'CITE'
  Seurat::VariableFeatures(seur_obj) <- rownames(seur_obj[["CITE"]])

  seur_obj <- Seurat::ScaleData(seur_obj)
  seur_obj <- Seurat::RunPCA(seur_obj,reduction.name = 'apca',reduction.key = 'apca_')
  seur_obj <- Seurat::FindNeighbors(seur_obj, dims = 1:min(length(rownames(seur_obj[['CITE']]))-1, 20), reduction = "apca")

  seur_obj <- Seurat::FindClusters(seur_obj, graph.name = "CITE_snn", algorithm = 3, verbose = FALSE)
  seur_obj <- Seurat::RunUMAP(seur_obj, reduction = 'apca', dims = 1:30, assay = 'ADT',
                              reduction.name = 'adt.umap', reduction.key = 'adtUMAP_')

}
