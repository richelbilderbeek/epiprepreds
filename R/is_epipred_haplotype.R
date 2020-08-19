#' Is the haplotype a valid EpitopePrediction hapolotype?
#' @inheritParams default_params_doc
#' @export
is_epipred_haplotype <- function(haplotype) {
  # 'EpitopePrediction::supportedMHCs' produces output.
  # Will be fixed by
  # https://github.com/jtextor/epitope-prediction/pull/1
  sink("/dev/null")
  mhcs <- EpitopePrediction::supportedMHCs()$mhc
  sink()
  haplotype %in% mhcs
}
