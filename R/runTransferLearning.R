runTransferLearning <- function(reference_file, seur1) {
  reference <- Seurat::LoadH5Seurat(reference_file)

  anchors <- Seurat::FindTransferAnchors(
    reference = reference,
    query = seur1,
    normalization.method = "SCT",
    reference.reduction = "spca",
    dims = 1:50
  )

  seur1 <- Seurat::MapQuery(
    anchorset = anchors,
    query = seur1,
    reference = reference,
    refdata = list(
      celltype.l1 = "celltype.l1",
      celltype.l2 = "celltype.l2",
      predicted_ADT = "ADT"
    ),
    reference.reduction = "spca",
    reduction.model = "wnn.umap"
  )

  return(seur1)
}

