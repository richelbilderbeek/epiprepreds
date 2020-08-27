#' Internal function
#'
#' Internal function to 'shred a protein', that is,
#' to obtain all peptides of length \code{peptide_length}
#' from the protein sequence
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @examples
#' shred_protein(
#'   protein_sequence = "FANTASTICALLY",
#'   peptide_length = 9
#' )
#' @export
shred_protein <- function(
  protein_sequence,
  peptide_length
) {
  n <- nchar(protein_sequence) - peptide_length + 1
  peptides <- rep(NA, n)
  for (i in seq_len(n)) {
    peptides[i] <- substr(protein_sequence, i, i + peptide_length - 1)
  }
  peptides
}
