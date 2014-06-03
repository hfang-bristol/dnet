\name{dPvalAggregate}
\alias{dPvalAggregate}
\title{Function to aggregate p values}
\usage{
dPvalAggregate(pmatrix, method = c("orderStatistic", "fishers"),
order = ncol(pmatrix))
}
\arguments{
\item{pmatrix}{a data frame or matrix of p-values}

\item{method}{the method used. It can be either
"orderStatistic" for the method based on the order
statistics of p-values, or "fishers" for Fisher's method}

\item{order}{an integeter specifying the order used for
the aggregation according to on the order statistics of
p-values}
}
\value{
\itemize{ \item{\code{ap}: a vector with the length
nrow(pmatrix), containing aggregated p-values} }
}
\description{
\code{dPvalAggregate} is supposed to aggregate a input
matrix p-values into a vector of aggregated p-values. The
aggregate operation is applied to each row of input matrix,
each resulting in an aggregated p-value. The method
implemented can be based on the order statistics of
p-values or according to Fisher's method.
}
\note{
For each row of input matrix with the \eqn{c} columns,
there are \eqn{c} p-values that are uniformly independently
distributed over [0,1] under the null hypothesis (uniform
distribution). According to the order statisitcs, they
follow the Beta distribution with the paramters
\eqn{a=order} and \eqn{b=c-order+1}. According to the the
Fisher's method, after transformation by
\eqn{-2*\sum^clog(pvalue)}, they follow Chi-Squared
distribution.
}
\examples{
# 1) generate an iid uniformly-distributed random matrix of 1000x3
pmatrix <- cbind(runif(1000), runif(1000), runif(1000))

# 2) aggregate according to the ordre statistics
ap <- dPvalAggregate(pmatrix, method="orderStatistic")

# 3) aggregate according to the Fisher's method
ap <- dPvalAggregate(pmatrix, method="fishers")
}
\seealso{
\code{\link{dPvalAggregate}}
}

