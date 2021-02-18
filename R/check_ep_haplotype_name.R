#' Internal function
#'
#' Internal function to check if the EpitopePrediction name is valid.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
check_ep_haplotype_name <- function(
  ep_haplotype_name
) {
  if (!ep_haplotype_name %in% epiprepreds::get_ep_haplotype_names()) {
    stop(
      "'ep_haplotype_name' is not a valid EpitopePrediction haplotype name. \n",
      "'ep_haplotype_name': ", ep_haplotype_name, " \n",
      "Tip 1: use 'get_haplotype_names()' to see the \n",
      "       supported MHC-I haplotype names. \n",
      "Tip 2: use 'to_ep_haplotype_name' to convert a regular \n",
      "       haplotype name to an EpitopePrediction haplotype name."
    )
  }
}
