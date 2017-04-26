\name{nroFigure}
\alias{nroFigure}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Map Visualization
}
\description{
Save a map to a Scalable Vector Graphics (SVG) file
}
\usage{
nroFigure(file, scene)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
   \item{file}{
Path to the SVG file where the map will be saved.
}
  \item{scene}{
List with three elements containing the SVG code, the bounding box of the map with labels and the bounding box of the map without labels, see \code{\link{nroCircus}} for details.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
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
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{nroCircus}} for details on the scene input
}
\examples{
# Create a temporary file.
tmp <- tempfile()
  
# Create the SOM topology for a map of radius 4 with 66 units.
sm <- nroKoho(matrix(1:16, nrow = 4, ncol = 4),
  radius = 4)

# Find hexadecimal color codings for a map with 66 units.
colorDef <- nroColorize(sample.int(101, size=66, replace=TRUE))
  
# Create SVG output.
smfig <- nroCircus(map=sm, colors=colorDef, labels=character(), title="Test")

# Save SVG output to the temporary file.
nroFigure(file = tmp, scene=smfig)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ SOM }
%\keyword{ Analysis }% __ONLY ONE__ keyword per line
