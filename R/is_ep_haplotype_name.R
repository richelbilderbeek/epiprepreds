#' Is the haplotype name an EpitopePrediction haplotype name?
#'
#' Is the haplotype name an EpitopePrediction haplotype name?
#' @inheritParams default_params_doc
#' @return TRUE if the haplotype name is a valid
#'   EpitopePrediction haplotype name, FALSE otherwise
#' @export
is_ep_haplotype_name <- function(ep_haplotype_name) {
  is_valid <- FALSE
  try({
    epiprepreds::check_ep_haplotype_name(ep_haplotype_name)
    is_valid <- TRUE
  }
  )
  is_valid
}
