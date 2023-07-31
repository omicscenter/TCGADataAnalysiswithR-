# https://www.costalab.org/wp-content/uploads/2020/11/R_class_D3.html 
# https://www.costalab.org/teaching/
# readings 
# 1. https://bioconductor.org/packages/release/bioc/vignettes/TCGAbiolinks/inst/doc/query.html

# load packages
library("TCGAbiolinks")
library("tidyverse")

# get list of projects 
gdcprojects <- getGDCprojects()
getProjectSummary("TCGA-BRCA")


# building query 
query_TCGA <- GDCquery(project = "TCGA-BRCA", 
         data.category = "Transcriptome Profiling")
