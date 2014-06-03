\name{dDAGannotate}
\alias{dDAGannotate}
\title{Function to generate a subgraph of a direct acyclic graph (DAG) induced by the input annotation data}
\usage{
dDAGannotate(g, annotations, path.mode = c("all_paths",
"shortest_paths",
"all_shortest_paths"), verbose = TRUE)
}
\arguments{
\item{g}{an object of class "igraph" or "graphNEL"}

\item{annotations}{the vertices/nodes for which
annotation data are provided}

\item{path.mode}{the mode of paths induced by
vertices/nodes with input annotation data. It can be
"all_paths" for all possible paths to the root,
"shortest_paths" for only one path to the root (for each
node in query), "all_shortest_paths" for all shortest
paths to the root (i.e. for each node, find all shortest
paths with the equal lengths)}

\item{verbose}{logical to indicate whether the messages
will be displayed in the screen. By default, it sets to
true for display}
}
\value{
\itemize{ \item{\code{subg}: an induced subgraph, an object
of class "igraph". In addition to the original attributes
to nodes and edges, the return subgraph is also appended by
new node attributes: "annotations", which contains a list
of genes either as original annotations or inherited
annotations; "IC", which stands for information content
defined as negative 10-based log-transformed frequency of
genes annotated to that term.} }
}
\description{
\code{dDAGannotate} is supposed to produce a subgraph
induced by the input annotation data, given a direct
acyclic graph (DAG; an ontology). The input is a graph of
"igraph" or "graphNET" object, a list of the vertices
containing annotation data, and the mode defining the paths
to the root of DAG. The induced subgraph contains vertices
(with annotation data) and their ancestors along with the
defined paths to the root of DAG. The annotations at these
vertices (including their ancestors) are also updated
according to the true-path rule: a gene annotated to a term
should also be annotated by its all ancestor terms.
}
\note{
For the mode "shortest_paths", the induced subgraph is the
most concise, and thus informative for visualisation when
there are many nodes in query, while the mode "all_paths"
results in the complete subgraph.
}
\examples{
# 1) load HPPA as igraph object
data(ig.HPPA)
g <- ig.HPPA

# 2) load human genes annotated by HPPA
data(org.Hs.egHPPA)
GS <- org.Hs.egHPPA # as 'GS' object

# 3) prepare for annotation data
# randomly select vertices with annotation data
annotations <- GS$gs[sample(1:length(GS$gs),5)]

# 4) obtain the induced subgraph
# 4a) based on all possible paths (i.e. the complete subgraph induced)
dDAGannotate(g, annotations, path.mode="all_paths", verbose=TRUE)
# 4b) based on shortest paths (i.e. the most concise subgraph induced)
dag <- dDAGannotate(g, annotations, path.mode="shortest_paths",
verbose=TRUE)

# 5) color-code nodes/terms according to the number of annotations
data <- sapply(V(dag)$annotations, length)
names(data) <- V(dag)$name
visDAG(g=dag, data=data, node.info="both")
}
\seealso{
\code{\link{dDAGinduce}}, \code{\link{dDAGlevel}}
}

