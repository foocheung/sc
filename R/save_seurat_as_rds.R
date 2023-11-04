save_seurat_as_rds <- function(B1_US_merge, save_name) {
  save_name <- paste0(save_name, ".RDS")
  saveRDS(B1_US_merge, save_name)
}

