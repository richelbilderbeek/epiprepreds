#' Get the EpitopePrediction haplotype names
#' @examples
#' get_ep_haplotype_names()
#' @export
get_ep_haplotype_names <- function() {
  df <- EpitopePrediction::supportedMHCs()
  as.character(unique(df$mhc))
}
