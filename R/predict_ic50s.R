#' Predict IC50s
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @examples
#' predict_ic50s(
#'   protein_sequence = "FANTASTICFAMILYVW",
#'   peptide_length = 9,
#'   haplotype_name = "HLA-A*01:01",
#'   sink_filename = "/dev/null"
#' )
#' @export
predict_ic50s <- function(
  protein_sequence,
  peptide_length,
  haplotype_name,
  sink_filename = "/dev/null"
) {
  epiprepreds::check_haplotype_name(
    haplotype_name,
    sink_filename = sink_filename
  )
  ep_haplotype_name <- epiprepreds::to_ep_haplotype_name(haplotype_name)
  epiprepreds::check_ep_haplotype_name(
    ep_haplotype_name,
    sink_filename = sink_filename
  )
  epiprepreds::check_protein_sequence(protein_sequence)

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
