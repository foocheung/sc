filter_cells_for_antibody_clumps <- function(B1_US_merge) {
  B1_US_merge <- subset(B1_US_merge, subset = nCount_CITE < stats::quantile(B1_US_merge$nCount_CITE, probs = c(0.995)))
  return(B1_US_merge)
}

