#' Check if the haplotype name is valid and supported
#'
#' Check if the haplotype name is valid and supported
#' by EpitopePrediction.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
check_haplotype_name <- function(
  haplotype_name,
  sink_filename = "/dev/null"
) {
  epiprepreds::check_ep_haplotype_name(
    epiprepreds::to_ep_haplotype_name(
      haplotype_name,
      sink_filename = sink_filename
    )
  )
}
