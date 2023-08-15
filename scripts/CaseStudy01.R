# Case study n. 1: Pan Cancer downstream analysis BRCA
# https://bioconductor.org/packages/release/bioc/vignettes/TCGAbiolinks/inst/doc/casestudy.html

# load packages 
library(SummarizedExperiment)
library(TCGAbiolinks)
library(maftools)

# build query
query_exp <- GDCquery(
  project = "TCGA-BRCA", 
  data.category = "Transcriptome Profiling",
  data.type = "Gene Expression Quantification", 
  workflow.type = "STAR - Counts",
  sample.type = c("Primary Tumor","Solid Tissue Normal")
)

# download expression data 
GDCdownload(
  query = query_exp,
  files.per.chunk = 100
)

# brca expression data preparation 
brca_exp <- GDCprepare(
  query = query.exp, 
  save = TRUE, 
  save.filename = "brcaExp.rda"
)

# get subtype information
infomation.subtype <- TCGAquery_subtype(tumor = "BRCA")

# get clinical data
information.clinical <- GDCquery_clinic(project = "TCGA-BRCA",type = "clinical") 

# Which samples are Primary Tumor
samples.primary.tumour <- brca.exp$barcode[brca.exp$shortLetterCode == "TP"]

# which samples are solid tissue normal
samples.solid.tissue.normal <- brca.exp$barcode[brca.exp$shortLetterCode == "NT"]

