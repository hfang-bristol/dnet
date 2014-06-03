\name{org.Hs.string900}
\alias{org.Hs.string900}

\title{Human functional protein association network from STRING with highest confidence (no less than 900).}

\usage{
data(org.Hs.string900)
}

\description{
An igraph object that contains a functional protein association network in human. The network is extracted from the STRING database (version 9.1). Only those associations with medium confidence (score>=900) are retained. 
}

\value{
    an object of class "igraph" (see \url{http://igraph.sourceforge.net/doc/R/aaa-igraph-package.html}). It has attributes for both vertices and edges. 
    Below are attributes for the vertices:
    \itemize{
        \item{\code{name}: unique id for the vertices}
        \item{\code{seqid}: protein seqid for the vertices}
        \item{\code{geneid}: Entrez geneid (if any) for the vertices}
        \item{\code{symbol}: gene symbol (if any) for the vertices}
        \item{\code{description}: gene description (if any) for the vertices}        
    }
    Below are attributes for the edges:
    \itemize{
        \item{\code{neighborhood_score}: predictive score based on neighborhood data}
        \item{\code{fusion_score}: predictive score based on fusion data}
        \item{\code{cooccurence_score}: predictive score based on cooccurence data}
        \item{\code{coexpression_score}: predictive score based on coexpression}
        \item{\code{experimental_score}: predictive score based on experimental data}
        \item{\code{database_score}: predictive score based on database}
        \item{\code{textmining_score}: predictive score based on text mining}
        \item{\code{combined_score}: combined score from all above predictive scores}
    }
}

\references{
Franceschini et al. (2013) STRING v9.1: protein-protein interaction networks, with increased coverage and integration. \emph{Nucleic Acids Res}, 41:D808-D815.
}

\keyword{datasets}

\examples{
data(org.Hs.string900)
org.Hs.string900
}
