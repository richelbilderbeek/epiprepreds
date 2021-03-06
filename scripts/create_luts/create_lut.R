# Creates lookup tables
#
# Usage:
#
#   Rscript create_luts.R [peptide_source] [peptide_length] [haplotype_index]
#
# * [peptide_source]: peptide source, must be 'random', 'covid', 'human'
# * [peptide_length]: a number from 1 to and including 15
# * [haplotype_index]: the haplotype index, from 1 to and including 284
#
# For example:
#
#   Rscript create_luts.R 1
#
library(testthat)
args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 3) {
  args <- c("random", "9", "h1")
}
testthat::expect_equal(length(args), 3)
message(
  "Running with arguments '", args[1], "', '", args[2], "' and '", args[3], "'"
)


peptide_source <- args[1]
message("peptide_source: '", peptide_source, "'")
peptide_length <- args[2]
message("peptide_length: '", peptide_length, "'")
haplotype_id <- args[3]
message("haplotype_id: '", haplotype_id, "'")
testthat::expect_true(haplotype_id %in% epiprepreds::get_haplotype_lut()$id)

t_haplotype <- epiprepreds::get_haplotype_lut()
haplotype <- t_haplotype$haplotype[t_haplotype$id == haplotype_id]
message("haplotype: ", haplotype)

supported_mhcs <- EpitopePrediction::supportedMHCs()

if (nrow(supported_mhcs[supported_mhcs$mhc == haplotype & supported_mhcs$l == peptide_length, ]) == 0) {
  stop(
    "Combination of haplotype '", haplotype, "' ",
    "and peptide length '", peptide_length, "' ",
    "not supported by EpitopePrediction"
  )
}

target_filename <- paste0(peptide_source, "_", haplotype_id, "_", peptide_length, ".csv")
message("target_filename: '", target_filename, "'")

n_peptides <- 10000
message("n_peptides: ", n_peptides)

n_quantiles <- 100
message("n_quantiles: ", n_quantiles)

library(EpitopePrediction)

peptides <- replicate(
  n = n_peptides,
  epiprepreds::create_random_peptide(length = peptide_length)
)

ic50s <- EpitopePrediction::smm(
  x = peptides,
  mhc = haplotype,
  output.IC50 = TRUE
)

q <- epiprepreds::convert_ic50s_to_quantiles(ic50s, n = n_quantiles)

readr::write_csv(q, target_filename)
