test_that("use", {
  expect_silent(
    check_haplotype_name(
      haplotype = "H-2-Db"
    )
  )
  expect_error(check_haplotype_name("nonsense"))
})
