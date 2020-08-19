#' Convert to EpitopePrediction name
#'
#' Convert a formally named MHC-I haplotype
#' to its EpitopePrediction counterpart.
#' @inheritParams default_params_doc
#' @export
to_epipred_name <- function(haplotype) {
  stringr::str_replace_all(
    string = haplotype,
    pattern = "\\*",
    replacement = "-"
  )
}
