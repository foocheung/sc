monaco_ann1 <-function(seur_obj) {

  monaco.ref <- celldex::MonacoImmuneData()
  seur_obj<- as.SingleCellExperiment(seur_obj)

  monaco.main <- SingleR::SingleR(test = seur_obj,assay.type.test = 1,ref = monaco.ref,labels = monaco.ref$label.main)

  seur_obj$monaco.main <- monaco.main$pruned.labels


}
