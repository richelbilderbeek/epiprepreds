#' Get the lookup-table
#'
#' Get the lookup-table for a specific
#' peptide size and haplotype.
#' @inheritParams default_params_doc
#' @export
get_lut <- function(
  peptide_length,
  ep_haplotype_name
) {
  epiprepreds::check_ep_haplotype_name(ep_haplotype_name)
  filename <- epiprepreds::get_lut_filename(
    peptide_length = peptide_length,
    ep_haplotype_name = ep_haplotype_name
  )
  readr::read_csv(
    filename,
    col_types = readr::cols(
      q = readr::col_double(),
      ic50 = readr::col_double()
    )
  )
}
