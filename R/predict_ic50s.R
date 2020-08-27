#' Predict IC50s
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
predict_ic50s <- function(
  protein_sequence,
  peptide_length,
  haplotype_name
) {
  epiprepreds::check_haplotype_name(haplotype_name)
  ep_haplotype_name <- to_ep_haplotype_name(haplotype_name)
  epiprepreds::check_ep_haplotype_name(ep_haplotype_name)

  peptides <- epiprepreds::shred_protein(
    protein_sequence = protein_sequence,
    peptide_length = peptide_length
  )
  ic50s <- tibble::tibble(
    peptide = peptides,
    ic50 = NA
  )
  tryCatch({
  ic50s$ic50 <- EpitopePrediction::smm(
    x = peptides,
    mhc = ep_haplotype_name
  )
  }, error = function(e) {
      stop(
        "EpitopePrediction::smm failed. \n",
        "protein_sequence: ", protein_sequence, " \n",
        "peptide_length: ", peptide_length, " \n",
        "haplotype_name: ", haplotype_name, " \n",
        "ep_haplotype_name: ", ep_haplotype_name, " \n",
        "Error message: ", e$msg, " "
      )
    }
  )
  testthat::expect_equal(
    nrow(ic50s),
    nchar(protein_sequence) - peptide_length + 1
  )
  ic50s
}

