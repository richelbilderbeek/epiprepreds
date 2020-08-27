test_that("use", {
  lut <- get_haplotype_lut()
  index <- 42
  ep_haplotype_names <- lut$haplotype[index]
  haplotype_id <- convert_haplotypes_to_haplotype_ids(
    ep_haplotype_names = ep_haplotype_names
  )
  expect_equal(haplotype_id, lut$id[index])
})
