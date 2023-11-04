merge_seurat_objects <- function(B1_US_SeuratObj, lanes) {
  if (length(lanes) == 1){
    B1_US_merge = B1_US_SeuratObj[[1]]
  } else {
    B1_US_merge = merge(B1_US_SeuratObj[[1]], B1_US_SeuratObj[2:length(lanes)])
  }
  return(B1_US_merge)
}

