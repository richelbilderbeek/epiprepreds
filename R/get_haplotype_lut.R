#' Internal function
#'
#' Create the mapping from the EpitopePrediction haplotype names
#' to a haplotype ID
#' @examples
#' get_haplotype_lut()
#' @export
get_haplotype_lut <- function() {
  t <- tibble::tibble(
    haplotype = epiprepreds::get_ep_haplotype_names(),
    id = NA
  )
  t$id <- paste0("h", seq(1, nrow(t)))
  t
}
