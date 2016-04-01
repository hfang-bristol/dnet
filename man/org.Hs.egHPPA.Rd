\name{org.Hs.egHPPA}
\alias{org.Hs.egHPPA}

\title{Annotations of Human Entrez Genes (EG) by Human Phenotype Phenotypic Abnormality (HPPA).}


\usage{
data(org.Hs.egHPPA)
}

\description{
An R object that contains associations between HPPA terms and Human Entrez Genes. This data is first prepared based on \url{http://purl.obolibrary.org/obo/hp.obo} and  \url{http://compbio.charite.de/hudson/job/hpo.annotations.monthly/lastStableBuild/artifact/annotation/ALL_SOURCES_ALL_FREQUENCIES_genes_to_phenotype.txt}.
}

\value{
    an object of class "GS", a list with following components:
    \itemize{
        \item{\code{set_info}: a matrix of nSet X 4 containing gene set information, where nSet is the number of gene sets (i.e. HPPA terms), and the 4 columns are "setID" (i.e. "Term ID"), "name" (i.e. "Term Name"), "namespace" and "distance"}
        \item{\code{gs}: a list of gene sets, each storing gene members thereof. Always, gene sets are identified by "setID" and gene members identified by "Entrez ID"}
    }
}

\references{
Robinson et al. (2012) The Human Phenotype Ontology: a tool for annotating and analyzing human hereditary disease. \emph{Am J Hum Genet}, 83:610-615.
}

\keyword{datasets}


\examples{
org.Hs.egHPPA <- dRDataLoader(RData='org.Hs.egHPPA')
names(org.Hs.egHPPA)
}
