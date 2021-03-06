% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_lut.R
\name{get_lut}
\alias{get_lut}
\title{Get the lookup-table}
\usage{
get_lut(peptide_length, ep_haplotype_name)
}
\arguments{
\item{peptide_length}{length of the peptide in amino acids}

\item{ep_haplotype_name}{a haplotype name as used internally
by EpitopePrediction,
Use \link{to_ep_haplotype_name} to convert a formal haplotype
name to an EpitopePrediction haplotype name}
}
\description{
Get the lookup-table for a specific
peptide size and haplotype.
}
