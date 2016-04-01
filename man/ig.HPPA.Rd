\name{ig.HPPA}
\alias{ig.HPPA}

\title{Human Phenotype Phenotypic Abnormality (HPPA).}


\usage{
data(ig.HPPA)
}

\description{
An R object that contains information on Human Phenotype Phenotypic Abnormality terms. These terms are organised as a direct acyclic graph (DAG), which is further stored as an object of the class 'igraph' (see \url{http://igraph.org/r/doc/aaa-igraph-package.html}). This data is prepared based on \url{http://purl.obolibrary.org/obo/hp.obo}.
}

\value{
    an object of class "igraph". As a direct graph, it has attributes to vertices/nodes and edges:
    \itemize{
        \item{\code{vertex attributes}: "name" (i.e. "Term ID"), "term_id" (i.e. "Term ID"), "term_name" (i.e "Term Name") and "term_distance" (i.e. Term Distance: the distance to the root; always 0 for the root itself)}
        \item{\code{edge attributes}: "relation" (either 'is_a' or 'part_of')}
    }
}

\references{
Robinson et al. (2012) The Human Phenotype Ontology: a tool for annotating and analyzing human hereditary disease. \emph{Am J Hum Genet}, 83:610-615.
}


\keyword{datasets}

\examples{
ig.HPPA <- dRDataLoader(RData='ig.HPPA')
ig.HPPA
}
