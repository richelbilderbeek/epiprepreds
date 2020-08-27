test_that("epiprepreds", {

  expect_silent(
    predict_ic50s(
      protein_sequence = "FANTASTICFAMILYVW",
      peptide_length = 9,
      haplotype = "HLA-A*01:01"
    )
  )

  expect_error(
    predict_ic50s(
      protein_sequence = "FANTASTICFAMILYVW",
      peptide_length = 9,
      haplotype = "HLA-DRB1*0101"
    )
  )
})

test_that("EpitopePrediction bug", {

  # Error at private GitHub repo:
  # https://github.com/richelbilderbeek/bbbq_article/issues/56
  protein_sequence <- "MAAMAVALRGLGGRFRWRTQAVAGGVRGAARGAAAGQRDYDLLVVGGGSGGLACAKEAAQLGRKVAVVDYVEPSPQGTRWGLGGTCVNVGCIPKKLMHQAALLGGLIQDAPNYGWEVAQPVPHDWRKMAEAVQNHVKSLNWGHRVQLQDRKVKYFNIKASFVDEHTVCGVAKGGKEILLSADHIIIATGGRPRYPTHIEGALEYGITSDDIFWLKESPGKTLVVGASYVALECAGFLTGIGLDTTIMMRSIPLRGFDQQMSSMVIEHMASHGTRFLRGCAPSRVRRLPDGQLQVTWEDSTTGKEDTGTFDTVLWAIGRVPDTRSLNLEKAGVDTSPDTQKILVDSREATSVPHIYAIGDVVEGRPELTPIAIMAGRLLVQRLFGGSSDLMDYDNVPTTVFTPLEYGCVGLSEEEAVARHGQEHVEVYHAHYKPLEFTVAGRDASQCYVKMVCLREPPQLVLGLHFLGPNAGEVTQGFALGIKCGASYAQVMRTVGIHPTCSEEVVKLRISKRSGLDPTVTGCUG" # nolint indeed long
  haplotype_name <- "HLA-A*02:01"
  peptide_length <- 9

  # Failed for unknown reason, reason is now clear
  expect_error(
    predict_ic50s(
      protein_sequence = protein_sequence,
      peptide_length = peptide_length,
      haplotype_name = haplotype_name
    ),
    "'protein_sequence' contains invalid amino acids"
  )
})
