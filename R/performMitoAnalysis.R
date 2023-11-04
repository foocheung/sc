performMitoAnalysis <- function(seur1) {
  mito.genes <- grep(pattern = "^MT-", x = rownames(seur1), value = TRUE)
  seur1 <- Seurat::AddMetaData(object = seur1, metadata = Matrix::colSums(seur1[mito.genes, ]) / Matrix::colSums(seur1), col.name = "percent.mito")
  return(seur1)
}




