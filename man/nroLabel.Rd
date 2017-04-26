\name{nroLabel}
\alias{nroLabel}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Map Visualization
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Optimize the selection of labels on map units.
}
\usage{
nroLabel(map, values, gap = 2.3)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{map}{
A list with the element 'topology', see \code{\link{nroKoho}} for details.
  }
  \item{values}{
A vector of map unit values.
  }
  \item{gap}{
Minimum distance between labeled map units.
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
The function assigns non-empty labels for units based on the absolute
deviations from the average unit value. The most extreme units are
picked first, and then the remaining units are prioritized based on
their value and distance to the other units already labeled.
}
\value{
A vector of character labels for each unit.
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
# Create SOM topology for map of radius 4 with 66 units.
sm <- nroKoho(matrix(1:16, nrow = 4, ncol = 4),
  radius = 4)

# Get labels.
labels <- nroLabel(map = sm, 
  values = sample.int(101,size=66,replace=TRUE),
  gap = 2.3)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ SOM }
%\keyword{ Analysis }% __ONLY ONE__ keyword per line
