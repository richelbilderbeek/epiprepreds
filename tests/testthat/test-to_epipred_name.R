test_that("use", {
  mhc1_haplotypes <- c(
    "HLA-A*01:01",
    "HLA-A*02:01",
    "HLA-A*03:01",
    "HLA-A*24:02",
    "HLA-A*26:01",
    "HLA-B*07:02",
    "HLA-B*08:01",
    "HLA-B*18:01",
    "HLA-B*27:05",
    "HLA-B*39:01",
    "HLA-B*40:02",
    "HLA-B*58:01",
    "HLA-B*15:01"
  )
  for (mhc1_haplotype in mhc1_haplotypes) {
    epipred_name <- to_epipred_name(mhc1_haplotype)
    message(mhc1_haplotype, " -> ", epipred_name)
    expect_true(is_epipred_haplotype(epipred_name))
  }
})
