\name{dRWRpipeline}
\alias{dRWRpipeline}
\title{Function to setup a pipeine to estimate RWR-based contact strength between samples from an input gene-sample data matrix and an input graph}
\usage{
dRWRpipeline(data, g, method = c("direct", "indirect"),
normalise = c("laplacian", "row", "column", "none"), restart = 0.75,
normalise.affinity.matrix = c("none", "quantile"),
permutation = c("random", "degree"), num.permutation = 10,
p.adjust.method = c("BH", "BY", "bonferroni", "holm", "hochberg",
"hommel"),
adjp.cutoff = 0.05, parallel = TRUE, multicores = NULL, verbose = T)
}
\arguments{
\item{data}{an input gene-sample data matrix used for
seeds. Each value in input gene-sample matrix does not
necessarily have to be binary (non-zeros will be used as
a weight, but should be non-negative for easy
interpretation).}

\item{g}{an object of class "igraph" or "graphNEL"}

\item{method}{the method used to calculate RWR. It can be
'direct' for directly applying RWR, 'indirect' for
indirectly applying RWR (first pre-compute affinity
matrix and then derive the affinity score)}

\item{normalise}{the way to normalise the adjacency
matrix of the input graph. It can be 'laplacian' for
laplacian normalisation, 'row' for row-wise
normalisation, 'column' for column-wise normalisation, or
'none'}

\item{restart}{the restart probability used for RWR. The
restart probability takes the value from 0 to 1,
controlling the range from the starting nodes/seeds that
the walker will explore. The higher the value, the more
likely the walker is to visit the nodes centered on the
starting nodes. At the extreme when the restart
probability is zero, the walker moves freely to the
neighbors at each step without restarting from seeds,
i.e., following a random walk (RW)}

\item{normalise.affinity.matrix}{the way to normalise the
output affinity matrix. It can be 'none' for no
normalisation, 'quantile' for quantile normalisation to
ensure that columns (if multiple) of the output affinity
matrix have the same quantiles}

\item{permutation}{how to do permutation. It can be
'degree' for degree-preserving permutation, 'random' for
permutation in random}

\item{num.permutation}{the number of permutations used to
for generating the distribution of contact strength under
randomalisation}

\item{p.adjust.method}{the method used to adjust
p-values. It can be one of "BH", "BY", "bonferroni",
"holm", "hochberg" and "hommel". The first two methods
"BH" (widely used) and "BY" control the false discovery
rate (FDR: the expected proportion of false discoveries
amongst the rejected hypotheses); the last four methods
"bonferroni", "holm", "hochberg" and "hommel" are
designed to give strong control of the family-wise error
rate (FWER). Notes: FDR is a less stringent condition
than FWER}

\item{adjp.cutoff}{the cutoff of adjusted pvalue to
construct the contact graph}

\item{parallel}{logical to indicate whether parallel
computation with multicores is used. By default, it sets
to true, but not necessarily does so. Partly because
parallel backends available will be system-specific (now
only Linux or Mac OS). Also, it will depend on whether
these two packages "foreach" and "doMC" have been
installed. It can be installed via:
\code{source("http://bioconductor.org/biocLite.R");
biocLite(c("foreach","doMC"))}. If not yet installed,
this option will be disabled}

\item{multicores}{an integer to specify how many cores
will be registered as the multicore parallel backend to
the 'foreach' package. If NULL, it will use a half of
cores available in a user's computer. This option only
works when parallel computation is enabled}

\item{verbose}{logical to indicate whether the messages
will be displayed in the screen. By default, it sets to
true for display}
}
\value{
an object of class "dContact", a list with following
components: \itemize{ \item{\code{ratio}: a symmetric
matrix storing ratio (the observed against the expected)
between pairwise samples} \item{\code{zscore}: a symmetric
matrix storing zscore between pairwise samples}
\item{\code{pval}: a symmetric matrix storing pvalue
between pairwise samples} \item{\code{adjpval}: a symmetric
matrix storing adjusted pvalue between pairwise samples}
\item{\code{cgraph}: the constructed contact graph (as a
'igraph' object) under the cutoff of adjusted value}
\item{\code{Amatrix}: a pre-computated affinity matrix when
using 'inderect' method; NULL otherwise} \item{\code{call}:
the call that produced this result} }
}
\description{
\code{dRWRpipeline} is supposed to estimate sample
relationships (ie. contact strength between samples) from
an input gene-sample matrix and an input graph. The
pipeline includes: 1) random walk restart (RWR) of the
input graph using the input matrix as seeds; 2) calculation
of contact strength (inner products of RWR-smoothed columns
of input matrix); 3) estimation of the contact signficance
by a randomalisation procedure. It supports two methods how
to use RWR: 'direct' for directly applying RWR in the given
seeds; 'indirectly' for first pre-computing affinity matrix
of the input graph, and then deriving the affinity score.
Parallel computing is also supported for Linux or Mac
operating systems.
}
\note{
The choice of which method to use RWR depends on the number
of seed sets and the number of permutations for statistical
test. If the total product of both numbers are huge, it is
better to use 'indrect' method (for a single run). However,
if the user wants to re-use pre-computed affinity matrix
(ie. re-use the input graph a lot), then it is highly
recommended to sequentially use \code{\link{dRWR}} and
\code{\link{dRWRcontact}} instead.
}
\examples{
\dontrun{
# 1) generate a random graph according to the ER model
g <- erdos.renyi.game(100, 1/100)

# 2) produce the induced subgraph only based on the nodes in query
subg <- dNetInduce(g, V(g), knn=0)
V(subg)$name <- 1:vcount(subg)

# 3) estimate RWR dating based sample relationships
# define sets of seeds as data
# each seed with equal weight (i.e. all non-zero entries are '1')
aSeeds <- c(1,0,1,0,1)
bSeeds <- c(0,0,1,0,1)
data <- data.frame(aSeeds,bSeeds)
rownames(data) <- 1:5
# calcualte their two contact graph
dContact <- dRWRpipeline(data=data, g=subg, parallel=FALSE)
dContact
}
}
\seealso{
\code{\link{dRWR}}, \code{\link{dRWRcontact}},
\code{\link{dCheckParallel}}
}

