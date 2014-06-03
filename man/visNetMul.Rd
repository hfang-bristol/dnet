\name{visNetMul}
\alias{visNetMul}
\title{Function to visualise the same graph but with multiple graph node colorings according to input data matrix}
\usage{
visNetMul(g, data, height = 7, margin = rep(0.1, 4),
border.color = "#EEEEEE", colormap = c("bwr", "jet", "gbr", "wyr",
"br",
"yr", "rainbow", "wb"), ncolors = 40, zlim = NULL, colorbar = T,
colorbar.fraction = 0.25, newpage = T,
glayout = layout.fruchterman.reingold, mtext.side = 3, mtext.adj = 0,
mtext.cex = 1, mtext.font = 2, mtext.col = "black", ...)
}
\arguments{
\item{g}{an object of class "igraph" or "graphNEL"}

\item{data}{an input data matrix used to color-code
vertices/nodes. One column corresponds to one graph node
coloring. The input matrix must have row names, and these
names should include all node names of input graph, i.e.
V(g)$name, since there is a mapping operation. After
mapping, the length of the patern vector should be the
same as the number of nodes of input graph. The way of
how to color-code is to map values in the pattern onto
the whole colormap (see the next arguments: colormap,
ncolors, zlim and colorbar)}

\item{height}{a numeric value specifying the height of
device}

\item{margin}{margins as units of length 4 or 1}

\item{border.color}{the border color of each figure}

\item{colormap}{short name for the colormap. It can be
one of "jet" (jet colormap), "bwr" (blue-white-red
colormap), "gbr" (green-black-red colormap), "wyr"
(white-yellow-red colormap), "br" (black-red colormap),
"yr" (yellow-red colormap), "wb" (white-black colormap),
and "rainbow" (rainbow colormap, that is,
red-yellow-green-cyan-blue-magenta). Alternatively, any
hyphen-separated HTML color names, e.g.
"blue-black-yellow", "royalblue-white-sandybrown",
"darkgreen-white-darkviolet". A list of standard color
names can be found in
\url{http://html-color-codes.info/color-names}}

\item{ncolors}{the number of colors specified over the
colormap}

\item{zlim}{the minimum and maximum z/patttern values for
which colors should be plotted, defaulting to the range
of the finite values of z. Each of the given colors will
be used to color an equispaced interval of this range.
The midpoints of the intervals cover the range, so that
values just outside the range will be plotted}

\item{colorbar}{logical to indicate whether to append a
colorbar. If pattern is null, it always sets to false}

\item{colorbar.fraction}{the relative fraction of
colorbar block against the figure block}

\item{newpage}{logical to indicate whether to open a new
page. By default, it sets to true for opening a new page}

\item{glayout}{either a function or a numeric matrix
configuring how the vertices will be placed on the plot.
If layout is a function, this function will be called
with the graph as the single parameter to determine the
actual coordinates. This function can be one of
"layout.auto", "layout.random", "layout.circle",
"layout.sphere", "layout.fruchterman.reingold",
"layout.kamada.kawai", "layout.spring",
"layout.reingold.tilford",
"layout.fruchterman.reingold.grid", "layout.lgl",
"layout.graphopt", "layout.svd" and "layout.norm". A full
explanation of these layouts can be found in
\url{http://igraph.org/r/doc/layout.html}}

\item{mtext.side}{on which side of the mtext plot
(1=bottom, 2=left, 3=top, 4=right)}

\item{mtext.adj}{the adjustment for mtext alignment (0
for left or bottom alignment, 1 for right or top
alignment)}

\item{mtext.cex}{the font size of mtext labels}

\item{mtext.font}{the font weight of mtext labels}

\item{mtext.col}{the color of mtext labels}

\item{...}{additional graphic parameters. See
\url{http://igraph.org/r/doc/plot.common.html} for the
complete list.}
}
\value{
invisible
}
\description{
\code{visNetMul} is supposed to visualise the same graph
but with multiple colorings according to input data matrix
}
\note{
none
}
\examples{
# 1) generate a random graph according to the ER model
g <- erdos.renyi.game(100, 1/80)

# 2) produce the induced subgraph only based on the nodes in query
subg <- dNetInduce(g, V(g), knn=0)

# 3) visualise the module with vertices being color-coded by scores
nnodes <- vcount(subg)
nsamples <- 10
data <- matrix(runif(nnodes*nsamples), nrow=nnodes, ncol=nsamples)
rownames(data) <- V(subg)$name
visNetMul(g=subg, colormap="bwr", data=data,
glayout=layout.fruchterman.reingold)
}
\seealso{
\code{\link{visNet}}
}

