read_demux_files <- function(lanes, demuxdir, B1_US_merge) {
  B1_US_demuxbestList <- list()
  for(i in 1:length(lanes)){
    B1_US_demuxbestList[[i]] = read.table(paste(demuxdir, "S2_23_306_3_",lanes[i],".best", sep = ""), sep = "\t", header = TRUE)
  }

  for(i in 1:length(lanes)){
    B1_US_demuxbestList[[i]]$"BEST.GUESS" =  gsub("/Aligned.*|outdir/Manthiram_|_output|_S39|_S45|_S44" , '',perl=TRUE,B1_US_demuxbestList[[i]]$BEST.GUESS)
    B1_US_demuxbestList[[i]]$"NEXT.GUESS"=  gsub("/Aligned.*|outdir/Manthiram_|_output|_S39|_S45|_S44" , '',perl=TRUE,B1_US_demuxbestList[[i]]$NEXT.GUESS)
    B1_US_demuxbestList[[i]]$"SNG.BEST.GUESS"=  gsub("/Aligned.*|outdir/Manthiram_|_output|_S39|_S45|_S44" , '',perl=TRUE,B1_US_demuxbestList[[i]]$SNG.BEST.GUESS)
    B1_US_demuxbestList[[i]]$"SNG.NEXT.GUESS"=  gsub("/Aligned.*|outdir/Manthiram_|_output|_S39|_S45|_S44" , '',perl=TRUE,B1_US_demuxbestList[[i]]$SNG.NEXT.GUESS)
    B1_US_demuxbestList[[i]]$"DBL.BEST.GUESS"=  gsub("/Aligned.*|outdir/Manthiram_|_output|_S39|_S45|_S44" , '',perl=TRUE,B1_US_demuxbestList[[i]]$DBL.BEST.GUESS)
  }

  for(i in 1:length(lanes)){
    B1_US_demuxbestList[[i]]$NewBarcode = paste(substr(B1_US_demuxbestList[[i]]$BARCODE, start = 1, stop = 17), lanes[[i]], sep = "")
  }

  B1_US_demuxbestdf <- plyr::ldply(B1_US_demuxbestList, data.frame)
  rownames(B1_US_demuxbestdf) <- B1_US_demuxbestdf$NewBarcode
  B1_US_merge <- subset(B1_US_merge, cells =  B1_US_demuxbestdf$NewBarcode)
  B1_US_merge <- Seurat::AddMetaData(B1_US_merge, metadata = B1_US_demuxbestdf[colnames(B1_US_merge),])

  return(B1_US_merge)
}

