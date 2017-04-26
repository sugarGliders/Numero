\name{nroAggregate}
\alias{nroAggregate}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Map Statistics
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Estimate unit averages based on assigned map locations for each data point.
}
\usage{
nroAggregate(map, bmus, x = double())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{map}{
A list that must contain the element 'topology',
see \code{\link{nroKoho}} for details.  
  }
  \item{bmus}{ 
A vector of M best-matching units for the data values 
in 'x', see \code{\link{nroMatch}} for details.
  }
  \item{x}{
A vector of N data values, can be empty.
  }
}

\value{
A vector of average unit values after smoothing. If 'x' is empty,
smoothed sample counts are returned.
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
\code{\link{nroKoho}} for details on the SOM and \code{\link{nroMatch}} for details on the best matching unit labels 
}
\examples{
# Load input data.
dat = matrix(10:265, nrow = 64, ncol = 4)

# Create SOM topology.
sm <- nroKoho(matrix(1:16, nrow = 4, ncol = 4), 
  radius = 4)

# Calculate smoothed sample counts.
sv <- nroAggregate(map = sm, 
  bmus = sample.int(64,size=64,replace=TRUE))
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ SOM }
%\keyword{ Analysis }% __ONLY ONE__ keyword per line
