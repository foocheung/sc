monaco_ann2 <-function(seur_obj) {

  monaco.ref <- celldex::MonacoImmuneData()
  seur_obj<- as.SingleCellExperiment(seur_obj)

  monaco.fine <- SingleR::SingleR(test = seur_obj,assay.type.test = 1,ref = monaco.ref,labels = monaco.ref$label.fine)
  seur_obj$monaco.fine <- monaco.fine$pruned.labels

}

