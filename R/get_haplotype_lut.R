#' The mapping from an EpitopePrediction name to an ID
#' @export
get_haplotype_lut <- function() {
  # EpitopePrediction::supportedMHCs prints output
  # Pull Request to fix this is sent in May 2020 at
  # https://github.com/jtextor/epitope-prediction/pull/1
  sink("/dev/null")
  mhcs <- EpitopePrediction::supportedMHCs()$mhc
  sink()

  t <- tibble::tibble(
    haplotype = sort(unique(as.character(mhcs))),
    id = NA
  )
  t$id <- paste0("h", seq(1, nrow(t)))
  t
}
