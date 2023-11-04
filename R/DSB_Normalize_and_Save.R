DSB_Normalize_and_Save <- function(B1_US_merge) {
  isotype.control.name.vec <- c(rownames(B1_US_merge[["CITE"]][c(61,63,66,117,115,97,137,83 ),]))
  # Subset data
  SNG.US <- subset(B1_US_merge, subset = DROPLET.TYPE == "SNG")
  NEG.US <- subset(B1_US_merge, subset = DROPLET.TYPE == "AMB")

  # Save subsets
  saveRDS(SNG.US, "SNG.US.RDS")
  saveRDS(NEG.US, "NEG.US.RDS")

  # Perform DSB normalization
  norm_result <- dsb::DSBNormalizeProtein(
    cell_protein_matrix = as.matrix(Seurat::GetAssayData(SNG.US[["CITE"]], slot = "counts")),
    empty_drop_matrix = as.matrix(Seurat::GetAssayData(NEG.US[["CITE"]], slot = "counts")),
    define.pseudocount = TRUE, pseudocount.use = 10, denoise.counts = FALSE,
    isotype.control.name.vec = isotype.control.name.vec
  )
}

