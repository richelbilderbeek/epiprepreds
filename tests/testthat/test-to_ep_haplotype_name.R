test_that("use", {
  haplotype <- "HLA-A*01:01"
  expect_equal("HLA-A-01:01", to_ep_haplotype_name(haplotype))
})

test_that("use", {
  haplotype_names <- c(
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
  for (haplotype_name in haplotype_names) {
    ep_haplotype_name <- to_ep_haplotype_name(haplotype_name)
    message(haplotype_name, " -> ", ep_haplotype_name)
    expect_true(is_ep_haplotype_name(ep_haplotype_name))
  }
})
