create_seurat_objects2 <- function(B1_US_data, lanes) {
  B1_US_SeuratObj <- list()
  for(i in 1:length(lanes)){
    B1_US_SeuratObj[[i]] <- Seurat::CreateSeuratObject(counts = (B1_US_data[[i]]), assay = "RNA", min.feature = 0)
    B1_US_SeuratObj[[i]] <- Seurat::RenameCells(B1_US_SeuratObj[[i]], new.names = paste(substr(colnames(B1_US_SeuratObj[[i]]), start = 1, stop = 17), lanes[[i]], sep = ""))
    B1_US_SeuratObj[[i]]$Batch  <- rep("B1UnSort", length(colnames(B1_US_SeuratObj[[i]])))
    B1_US_SeuratObj[[i]]$Lane  <- rep(lanes[[i]], length(colnames(B1_US_SeuratObj[[i]])))
  }
  names(B1_US_data) = names(B1_US_SeuratObj) = lanes
  return(B1_US_SeuratObj)
}

