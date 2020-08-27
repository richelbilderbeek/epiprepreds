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

  skip("WIP")
  # Error at private GitHub repo:
  # https://github.com/richelbilderbeek/bbbq_article/issues/56
  protein_sequence <- "MAAMAVALRGLGGRFRWRTQAVAGGVRGAARGAAAGQRDYDLLVVGGGSGGLACAKEAAQLGRKVAVVDYVEPSPQGTRWGLGGTCVNVGCIPKKLMHQAALLGGLIQDAPNYGWEVAQPVPHDWRKMAEAVQNHVKSLNWGHRVQLQDRKVKYFNIKASFVDEHTVCGVAKGGKEILLSADHIIIATGGRPRYPTHIEGALEYGITSDDIFWLKESPGKTLVVGASYVALECAGFLTGIGLDTTIMMRSIPLRGFDQQMSSMVIEHMASHGTRFLRGCAPSRVRRLPDGQLQVTWEDSTTGKEDTGTFDTVLWAIGRVPDTRSLNLEKAGVDTSPDTQKILVDSREATSVPHIYAIGDVVEGRPELTPIAIMAGRLLVQRLFGGSSDLMDYDNVPTTVFTPLEYGCVGLSEEEAVARHGQEHVEVYHAHYKPLEFTVAGRDASQCYVKMVCLREPPQLVLGLHFLGPNAGEVTQGFALGIKCGASYAQVMRTVGIHPTCSEEVVKLRISKRSGLDPTVTGCUG" # nolint indeed long
  haplotype_name <- "HLA-A*02:01"
  peptide_length <- 9

  # Fails for unknown reason
  expect_silent(
    predict_ic50s(
      protein_sequence = protein_sequence,
      peptide_length = peptide_length,
      haplotype_name = haplotype_name
    )
  )
  epiprepreds::check_haplotype_name(haplotype_name)
  ep_haplotype_name <- to_ep_haplotype_name(haplotype_name)
  epiprepreds::check_ep_haplotype_name(ep_haplotype_name)

  peptides <- epiprepreds::shred_protein(
    protein_sequence = protein_sequence,
    peptide_length = peptide_length
  )
  peptides[514]
  peptides[515]
  peptides[516]
  Peptides::aaList()
  # Works
  EpitopePrediction::smm(
    x = peptides[1:514],
    mhc = ep_haplotype_name
  )
  EpitopePrediction::smm(
    x = peptides[515],
    mhc = ep_haplotype_name
  )
  EpitopePrediction::smm(
    x = peptides[516],
    mhc = ep_haplotype_name
  )
  testthat::expect_equal(
    nrow(ic50s),
    nchar(protein_sequence) - peptide_length + 1
  )



})
