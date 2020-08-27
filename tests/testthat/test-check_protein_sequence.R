test_that("use", {
  expect_silent(check_protein_sequence(protein_sequence = "FAMILYVW"))
  expect_silent(check_protein_sequence("GLDPTVTGC"))

  # The U is invalid
  # Caused https://github.com/richelbilderbeek/bbbq_article/issues/56
  expect_error(check_protein_sequence("LDPTVTGCU"))
  expect_error(check_protein_sequence("nonsense"))
})
