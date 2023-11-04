create_plots <- function(lane_summ_dat, subj_summ_dat, save_name) {
  plot_path2 <- paste0(save_name,"_qc_plots_count_cells_filter_singlecell.pdf")
  pdf(plot_path2)
  p1 <- ggplot2::ggplot(lane_summ_dat, aes(x = Lane, y = n)) +
    ggplot2::geom_col(aes(fill= DROPLET.TYPE), position = "dodge") +
    ggplot2::coord_flip()
  p2 <- ggplot2::ggplot(subj_summ_dat, aes(y = Lane, x = SNG.BEST.GUESS)) +
    ggplot2::geom_tile(aes(fill= log10(n))) +
    ggplot2::geom_text(aes(label = round(log10(n), 2))) +
    ggplot2::scale_fill_viridis_c() +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1))

  print(p1)
  print(p2)
  dev.off()
}

