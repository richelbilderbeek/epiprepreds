#' Internal function
#'
#' Internal function to determine if a the protein sequence is valid.
#' @inheritParams default_params_doc
#' @return TRUE if the protein sequence is valid
#' @author Richèl J.C. Bilderbeek
#' @examples
#' is_protein_sequence("FAMILYVW")
#' @export
is_protein_sequence <- function(protein_sequence) {
  is_valid <- FALSE
  tryCatch({
    epiprepreds::check_protein_sequence(protein_sequence)
    is_valid <- TRUE
  }, error = function(e) {} # nolint ignore error message
  )
  is_valid
}
