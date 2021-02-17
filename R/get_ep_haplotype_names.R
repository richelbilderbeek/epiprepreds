#' Get the EpitopePrediction haplotype names
#' @inheritParams default_params_doc
#' @examples
#' get_ep_haplotype_names()
#' @export
get_ep_haplotype_names <- function(
  sink_filename = "/dev/null"
) {
  # 'EpitopePrediction::supportedMHCs' produces output.
  # Will be fixed by
  # https://github.com/jtextor/epitope-prediction/pull/1
  sink(sink_filename)
  df <- EpitopePrediction::supportedMHCs()
  sink()
  as.character(unique(df$mhc))
}
