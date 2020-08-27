#' Is the haplotype name valid and supported?
#'
#' Is the haplotype name a valid and supported haplotype?
#' @inheritParams default_params_doc
#' @return TRUE if the haplotype name is a valid and supported
#'   haplotype name, FALSE otherwise
#' @export
is_haplotype_name <- function(haplotype_name) {
  is_valid <- FALSE
  try({
    epiprepreds::check_haplotype_name(haplotype_name)
    is_valid <- TRUE
  }
  )
  is_valid
}
