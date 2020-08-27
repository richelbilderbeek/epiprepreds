test_that("use", {
  expect_silent(
    get_ic50_threshold(
      peptide_length = 9,
      haplotype_name = "HLA-A-01:01",
      percentile = 0.02
    )
  )
})

test_that("detailed use", {

  haplotype_name = "HLA-A-01:01"
  ep_haplotype_name = to_ep_haplotype_name(haplotype_name)

  t <- readr::read_csv(
    get_lut_filename(
      peptide_length = 9,
      ep_haplotype_name = ep_haplotype_name
    )
  )
  lowest_ic50 <- min(t$ic50)
  median_ic50 <- median(t$ic50)
  heighest_ic50 <- max(t$ic50)

  # 2%: closest to low
  ic50 <- get_ic50_threshold(
    peptide_length = 9,
    haplotype_name = haplotype_name,
    percentile = 0.02
  )
  expect_true(ic50 < median_ic50)

  # 98%: closest to high
  ic50 <- get_ic50_threshold(
    peptide_length = 9,
    haplotype_name = haplotype_name,
    percentile = 0.98
  )
  expect_true(ic50 > median_ic50)
})

test_that("IC50 versus LUT", {

  return()

  ggplot2::ggplot(
    epiprepreds::get_lut(
      peptide_length = 9,
      ep_haplotype_name = "HLA-A-01:01"
    ),
    ggplot2::aes(x = q, y = ic50)
  ) + ggplot2::geom_point()
})

test_that("simulated peptides must be in LUT", {

  if (Sys.getenv("TRAVIS") == "") return()

  set.seed(42)
  # Simulate n peptides, check if these are in range
  n <- 10000
  peptide_length <- 9
  haplotype_name = "HLA-A-01:01"
  ep_haplotype_name = to_ep_haplotype_name(haplotype_name)
  peptides <- replicate(n = n, create_random_peptide(peptide_length))

  ic50s <- EpitopePrediction::smm(
    x = peptides,
    mhc = ep_haplotype_name,
    output.IC50 = TRUE
  )
  min_ic50 <- epiprepreds::get_ic50_threshold(
    peptide_length = peptide_length,
    haplotype_name = haplotype_name,
    percentile = 0.0
  )
  median_ic50 <- epiprepreds::get_ic50_threshold(
    peptide_length = peptide_length,
    haplotype_name = haplotype_name,
    percentile = 0.5
  )
  max_ic50 <- epiprepreds::get_ic50_threshold(
    peptide_length = peptide_length,
    haplotype_name = haplotype_name,
    percentile = 1.0
  )
  # All IC50s, are within the range
  expect_equal(n, sum(min_ic50 < ic50s & max_ic50 > ic50s))

  # Mean IC50s are similar
  expect_true(median(ic50s) > 0.93 * median_ic50)
  expect_true(median(ic50s) < 1.01 * median_ic50)
})
