test_that("use", {

  # 'EpitopePrediction::supportedMHCs' produces output.
  # Will be fixed by
  # https://github.com/jtextor/epitope-prediction/pull/1
  sink("/dev/null")
  haplotype <- EpitopePrediction::supportedMHCs()$mhc[42]
  sink()

  expect_true(is_epipred_haplotype(haplotype = haplotype))
})
