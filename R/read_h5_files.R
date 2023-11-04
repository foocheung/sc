read_h5_files <- function(lanes, rawdir) {
  B1_US_data <- list()
  for(i in 1:length(lanes)){
    B1_US_data[[i]] = Seurat::Read10X_h5(paste(rawdir, "GEX", lanes[i], "_filtered_feature_bc_matrix.h5", sep = ""))
  }
  return(B1_US_data)
}

