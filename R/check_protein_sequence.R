#' Internal function
#'
#' Internal function to check the protein sequence.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @examples
#' check_protein_sequence("FAMILYVW")
#' @export
check_protein_sequence <- function(protein_sequence) {
  aas <- stringr::str_split(protein_sequence, pattern = "")[[1]]
  invalid_indices <- which(
    !aas %in% Peptides::aaList()
  )
  if (length(invalid_indices) != 0) {
    stop(
      "'protein_sequence' contains invalid amino acids at indices ",
      paste0(invalid_indices, collapse = ", "),
      " that contain characters ",
      paste0(aas[invalid_indices], collapse = ", ")
    )
  }
}
