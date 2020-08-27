#' Internal function
#'
#' Internal function to get the filename for a lookup-table
#' for a specific peptide size and EpitopePrediction haplotype.
#' @inheritParams default_params_doc
#' @export
get_lut_filename <- function(
  peptide_length,
  ep_haplotype_name
) {
  haplotype_lut <- epiprepreds::get_haplotype_lut()

  if (!ep_haplotype_name %in% haplotype_lut$haplotype) {
    stop(
      "'ep_haplotype_name' not in lookup table. ",
      "'ep_haplotype_name': ", ep_haplotype_name
    )
  }
  haplotype_id <- haplotype_lut$id[ep_haplotype_name == haplotype_lut$haplotype]
  filename <- paste0("random_", haplotype_id, "_", peptide_length, ".csv")
  full <- system.file("extdata", filename, package = "epiprepreds")
  if (!file.exists(full)) {
    stop(
      glue::glue(
        "No lookup table found for the desired peptide length. \n",
        "'peptide_length': {peptide_length} \n",
        "'ep_haplotype_name':  '{ep_haplotype_name}' \n",
        "'filename': '{filename}'"
      )
    )
  }
  full
}
