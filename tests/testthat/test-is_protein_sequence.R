test_that("use", {
  expect_true(is_protein_sequence("FAMILYVW"))
  expect_true(is_protein_sequence("GLDPTVTGC"))

  # The U is invalid
  # Caused https://github.com/richelbilderbeek/bbbq_article/issues/56
  expect_false(is_protein_sequence("LDPTVTGCU"))
  expect_false(is_protein_sequence("nonsense"))
})
