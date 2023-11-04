filter_out_citeseq_outliers <- function(B1_US_merge) {
  B1_US_merge <- Seurat::AddMetaData(object = B1_US_merge, metadata = log1p(B1_US_merge$nCount_CITE), col.name = "nCount_CITE.log1p")
  return(B1_US_merge)
}

