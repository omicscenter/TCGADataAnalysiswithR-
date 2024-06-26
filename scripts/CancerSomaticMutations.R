# load packages 
library(maftools)
library(TCGAbiolinks)

# Path to TCGA LAML MAF file 
laml_maf <- system.file("extdata", "tcga_laml.maf.gz", package = "maftools")

# Clinical information containing survival information and histology
laml_clinical <- system.file("extdata", "tcga_laml_annot.tsv", package = "maftools")

laml <- read.maf(maf = laml_maf, clinicalData = laml_clinical)

# Without clinical data 
brca <- system.file("extdata", "brca.maf.gz", package = "maftools")
brca <- read.maf(maf = brca, verbose = FALSE)

# data view 
maf_data_view <- laml@data
maf_gene_summary <- laml@gene.summary

# access data using @ 
laml@variants.per.sample


# Access data using tcgabiolinks 
gdc_projects <- getGDCprojects()

summary <- getProjectSummary("TCGA-CHOL")

query.maf.hg19 <- GDCquery(project = "TCGA-CHOL", 
                           data.category = "Simple nucleotide variation", 
                           data.type = "Simple somatic mutation",
                           access = "open", 
                           file.type = "bcgsc.ca_CHOL.IlluminaHiSeq_DNASeq.1.somatic.maf",
                           legacy = TRUE)



