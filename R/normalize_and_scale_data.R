normalize_and_scale_data <- function(B1_US_merge) {
  B1_US_merge <- Seurat::NormalizeData(B1_US_merge)
  B1_US_merge <- Seurat::FindVariableFeatures(B1_US_merge)
  B1_US_merge <- Seurat::ScaleData(B1_US_merge)
  return(B1_US_merge)
}

