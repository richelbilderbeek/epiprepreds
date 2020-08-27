#' Internal function
#'
#' Internal function to convert one or more
#' EpitopePrediction haplotype names
#' to haplotype IDs
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @examples
#' convert_haplotypes_to_haplotype_ids("HLA-A-33:01")
#' @export
convert_haplotypes_to_haplotype_ids <- function(#nolint indeed a long function name
  ep_haplotype_names
) {
  haplotype_ids <- rep(NA, length(ep_haplotype_names))
  for (i in seq_along(haplotype_ids)) {
    haplotype_ids[i] <- epiprepreds::convert_haplotype_to_haplotype_id(
      ep_haplotype_names[i]
    )
  }
  haplotype_ids
}
