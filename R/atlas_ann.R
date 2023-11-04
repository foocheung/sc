atlas_ann <-function(seur_obj) {
  primary.ref <- celldex::HumanPrimaryCellAtlasData()
  seur_obj <- as.SingleCellExperiment(seur_obj)
  primary.main <- SingleR::SingleR(test = seur_obj,assay.type.test = 1,ref = primary.ref,labels = primary.ref$label.main)
  seur_obj$primary.main <- primary.main$pruned.labels
}
