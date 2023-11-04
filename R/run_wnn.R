run_wnn <-function(seur_obj) {
  #  seed(1234)
  seur_obj <- Seurat::FindMultiModalNeighbors(
    seur_obj, reduction.list = list("pca", "apca"),
    dims.list = list(1:20, 1:20), modality.weight.name = c("intRNA.weight", "intADT.weight"))

  seur_obj <- Seurat::FindClusters(seur_obj, graph.name = "wsnn", verbose = FALSE)
  seur_obj <- Seurat::RunUMAP(seur_obj, nn.name = "weighted.nn", reduction.name = "wnn.umap", reduction.key = "wnnUMAP_")
}
