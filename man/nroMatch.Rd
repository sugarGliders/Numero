\name{nroMatch}
\alias{nroMatch}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Find best-matching units
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Compare the multivariate samples from a dataset against the centroids
of a self-organizing map (SOM) (or similarly formatted profiles).
}
\usage{
nroMatch(som, x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{som}{
A list with an element 'centroids' that contains a matrix of reference
profiles. If the list represents a SOM, the user needs to ensure topology element from \code{\link{nroKoho}} is also present. If the list represents a trained SOM through \code{\link{nroTrain}}, then the presence of the history element will allow to evaluate the quality of the matching.
  }
  \item{x}{
A data matrix with identical column names to the centroids matrix.
  }
}

\details{
%%  ~~ If necessary, more details than the description above ~~
The matching error between a sample and a reference profile is defined as
the Euclidean distance in N-dimensional data space, where N is the number
of variables.
}
\value{
A data frame of three columns: BMU contains the best maching profile
indices (between 1 and the number of rows in centroids). QUALITY contains
quality values for the matching. They are NA if the SOM hasn't been trained with \code{\link{nroTrain}}, otherwise they compare the overall mean training error to the error for each BMU. If the BMU’s training error is smaller than the mean training error, than the quality measure is smaller than 1, otherwise it is equal or greater than 1. RDATA shows the proportion of data values that were available for matching.
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

\seealso{
\code{\link{nroKmeans}} for detail on centroids, \code{\link{nroKoho}} for details on the SOM and \code{\link{nroTrain}} for details on training the SOM 
}
\examples{
# Create a list of centroids.
ctds <- list(matrix(1:256, nrow = 64, ncol = 4))
names(ctds) <- c('centroids')

# Match the samples against the centroids.
myMatches <- nroMatch(som = ctds, 
  x = matrix(10:265, nrow = 64, ncol = 4))
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ SOM }
%\keyword{ 