#' Internal function
#'
#'
#' Internal function to convert an EpitopePrediction haplotype name
#' to a hapolotype ID
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @examples
#' convert_haplotype_to_haplotype_id("HLA-A-33:01")
#' @export
convert_haplotype_to_haplotype_id <- function(#nolint indeed a long function name
  ep_haplotype_name
) {
  lut <- epiprepreds::get_haplotype_lut()
  if (!ep_haplotype_name %in% lut$haplotype) {
    stop(
      "Invalid 'ep_haplotype_name'. \n",
      "'ep_haplotype_name': ", ep_haplotype_name
    )
  }
  lut$id[lut$haplotype == ep_haplotype_name]
}
