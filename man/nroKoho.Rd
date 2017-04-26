\name{nroKoho}
\alias{nroKoho}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Create a self-organizing map
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Interpolates the initial unit centroids of a self-organizing map based
on distance-weighted influences from the pre-determined seed profiles.
}
\usage{
nroKoho(seeds, radius = 3)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{seeds}{
A data matrix of K rows and N columns.
  }
  \item{radius}{
Map radius.
  }
}

\value{
A list containing two named elements: 'centroids' contains the
N-dimensional unit profiles, and 'topology' is an H x 6 matrix
that contains the 2D spatial layout for the map units: the first
two columns (X, Y) indicate the positions of units in Cartesian
coordinates, the other four columns (RADIUS1, RADIUS2, ANGLE1, ANGLE2) define the perimeter of the unit areas for visualisation on a circular map.
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
\code{\link{nroKmeans}} for details on the clustering that creates the centroids.
}
\examples{
centroids <- matrix(1:16, nrow = 4, ncol = 4)

# Outputs an initial, untrained self-organizing map (SOM).
som <- nroKoho(centroids)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ SOM }
%\keyword{ Analysis }% __ONLY ONE__ keyword per line
