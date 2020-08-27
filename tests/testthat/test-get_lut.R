test_that("use", {
  expect_silent(
    get_lut(
      peptide_length = 9,
      ep_haplotype_name = "HLA-A-01:01"
    )
  )
})
