#' Convert a haplotype name to an EpitopePrediction name
#'
#' Convert a formally named (MHC-I) haplotype name
#' to one to be used by the EpitopePrediction package
#' @inheritParams default_params_doc
#' @examples
#' to_ep_haplotype_name("HLA-A*01:01")
#' @author Richèl J.C. Bilderbeek
#' @export
to_ep_haplotype_name <- function(haplotype_name) {
  stringr::str_replace(
    string = haplotype_name,
    pattern = "\\*",
    replacement = "-"
  )
}
