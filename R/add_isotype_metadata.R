add_isotype_metadata <- function(B1_US_merge,isotype.control.name.vec ) {

  B1_US_merge <- Seurat::AddMetaData(object = B1_US_merge, metadata = colMeans(as.matrix(Seurat::GetAssayData(B1_US_merge, assay = "CITE", slot = "counts")[isotype.control.name.vec,])), col.name = "isotype.mean")

  B1_US_merge = subset(B1_US_merge, subset = isotype.mean < stats::quantile(B1_US_merge$isotype.mean, probs=0.99) )
  return(B1_US_merge)
}

