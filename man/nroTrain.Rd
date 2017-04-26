\name{nroTrain}
\alias{nroTrain}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Train Self-Organizing Map
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Iterative algorithm to adapt a self-organizing map (SOM) to a set of
multivariable data.
}
\usage{
nroTrain(som, x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{som}{
A list of three elements: 'centroids', 'bmus' and 'topology',
see \code{\link{nroKoho}} for additional details. The element 'bmus' contains
the best matching map unit for each data sample.
  }
  \item{x}{
A data matrix with the same column names as the 'centroids'.
  }
}

\value{
A copy of 'som', where the 'centroids' list element is updated
according to the data patterns. In addition, the quantization
errors during training is stored in the element 'history'.
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
\code{\link{nroKoho}} for details on the SOM
}
\examples{
# Define seeds for the SOM; typically they are obtained from nroKmeans.
mySeeds <- matrix(1:256, nrow = 64, ncol = 4)

# Create an initial, untrained SOM.
sm <- nroKoho(mySeeds, radius = 4)

# Train the SOM.
sm <- nroTrain(som = sm, x = mySeeds)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ SOM }
%\keyword{ Analysis }% __ONLY ONE__ keyword per line
