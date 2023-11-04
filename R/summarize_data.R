summarize_data <- function(B1_US_merge) {
  lane_summ_dat <- B1_US_merge %>%
    dplyr::group_by(Lane, DROPLET.TYPE) %>%
    dplyr::summarize(n = n())
  subj_summ_dat <- B1_US_merge %>%
    dplyr::filter(DROPLET.TYPE == "SNG") %>%
    dplyr::group_by(Lane, SNG.BEST.GUESS) %>%
    dplyr::summarize(n = n())

  return(list(lane_summ_dat = lane_summ_dat, subj_summ_dat = subj_summ_dat))
}

