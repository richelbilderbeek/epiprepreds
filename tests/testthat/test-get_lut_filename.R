test_that("use", {
  peptide_length <- 9
  ep_haplotype_name <- "HLA-A-01:01"

  filename <- get_lut_filename(
    peptide_length = peptide_length,
    ep_haplotype_name = ep_haplotype_name
  )
  expect_equal(basename(filename), "random_h7_9.csv")
})

test_that("abuse", {
  peptide_length <- 9
  ep_haplotype_name <- "HLA-A-01:01"

  expect_silent(
    get_lut_filename(
      peptide_length = peptide_length,
      ep_haplotype_name = ep_haplotype_name
    )
  )
  expect_error(
    get_lut_filename(
      peptide_length = 123,
      ep_haplotype_name = ep_haplotype_name
    ),
    "No lookup table found for the desired peptide length"
  )
  expect_error(
    get_lut_filename(
      peptide_length = peptide_length,
      ep_haplotype_name = "nonsense"
    ),
    "'ep_haplotype_name' not in lookup table"
  )
})
