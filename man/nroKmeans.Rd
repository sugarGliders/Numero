\name{nroKmeans}
\alias{nroKmeans}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Data Clustering
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
K-means clustering for multi-dimensional data.
}
\usage{
nroKmeans(x, k = 3)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
Numerical data frame or matrix with M rows and N columns.
  }
  \item{k}{
Number of centroids.
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
 The K centroids are determined by Lloyd's algorithm with Euclidean
 distances.
}
\value{
A list of three named elements: 'codebook' is a k x N matrix of the main
results and 'bmus' contain the M centroid labels for each sample from the
original dataset. Finally, 'history' is the chronological record of
training errors.
}
%\references{
%% ~put references to the literature/web site here ~
%}
\author{
Song Gao

Stefan Mutter

Ville-Petteri Makinen
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%}
\examples{
# Cluster data into 4 clusters.
clust <- nroKmeans(matrix(1:10),
  k = 4)

# Show the centroids of each cluster.
print(clust$centroids)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ SOM }
%\keyword{ Analysis }% __ONLY ONE__ keyword per line
