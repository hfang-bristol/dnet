\name{TCGA_mutations}
\alias{TCGA_mutations}

\title{TCGA mutational profiles across 12 major cancer types from Kandoth et al. (2013)}

\usage{
data(TCGA_mutations)
}

\description{
This dataset is available from TCGA, containing somatic mutational profiles for 3096 cancer samples with survival data. These cancer samples belong to one of 12 major cancer types, including breast adenocarcinoma (BRCA), lung adenocarcinoma (LUAD), lung squamous cell carcinoma (LUSC), uterine corpus endometrial carcinoma (UCEC), glioblastoma multiforme (GBM), head and neck squamous cell carcinoma (HNSC), colon and rectal carcinoma (COAD/READ), bladder urothelial carcinoma (BLCA), kidney renal clear cell carcinoma (KIRC), ovarian serous carcinoma (OV) and acute myeloid leukaemia (LAML). For each patient sample, somatic mutations are represented as a profile of states on genes, where non-zero entry indicates a gene for which how many mutations have occurred in the tumor relative to germ line. The dataset is provided as an 'ExpressionSet' object.
}

\value{
    an object of class "ExpressionSet". It has slots for "assayData", "phenoData", and "featureData": 
    \itemize{
        \item{\code{assayData}: a matrix of 19171 genes X 3096 samples}
        \item{\code{phenoData}: variables describing sample phenotypes (i.e. columns in assayData), including clinical/survival information about samples: "time" (i.e. survival time in days), "status" (i.e., survival status: 0=alive; 1=dead), "Age" (the patient age in years), "Gender" (the patient gender: male/female), "TCGA_tumor_type", "Tumor_stage", "Tumor_grade"}
        \item{\code{featureData}: variables describing features (i.e. rows in assayData), including information about features/genes: "EntrezID" for gene EntrezID, "Symbol" for gene symbol, "Desc" for gene description, "Synonyms" for gene symbol alias}
    }
}

\references{
Kandoth et al. (2013). Mutational landscape and significance across 12 major cancer types. \emph{Nature}, 502(7471):333-9.
}

\keyword{datasets}
\examples{
#TCGA_mutations <- dRDataLoader(RData='TCGA_mutations')
data(TCGA_mutations)
TCGA_mutations
library(Biobase)
# extract information about the first 5 samples
pData(TCGA_mutations)[1:5,]
# extract information about the first 5 features
fData(TCGA_mutations)[1:5,]
# number of samples for each cancer type
table(pData(TCGA_mutations)$TCGA_tumor_type)
}
