#' Get the EpitopePrediction haplotype names
#' @examples
#' get_ep_haplotype_names()
#' @export
get_ep_haplotype_names <- function() {
  # 'EpitopePrediction::supportedMHCs' produces output.
  # Will be fixed by
  # https://github.com/jtextor/epitope-prediction/pull/1
  sink("/dev/null")
  df <- EpitopePrediction::supportedMHCs()
  sink()
  as.character(unique(df$mhc))
}
