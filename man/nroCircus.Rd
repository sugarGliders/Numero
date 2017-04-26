\name{nroCircus}
\alias{nroCircus}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Map Visualization
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Create a Scalable Vector Graphics code for a map coloring.
}
\usage{
nroCircus(map, colors, labels = character(), title = "")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{map}{
A list with the element 'topology', see \code{\link{nroKoho}} for details.
  }
  \item{colors}{
A character vector of N color codes, see \code{\link[grDevices]{rgb}} for details.
  }
  \item{labels}{
A character vector of H unit labels
  }
  \item{title}{
Text for the plot title
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~ 
Some non-alphanumeric characters are not supported and will be
automatically converted to '_'. Too long labels or title will be
truncated.
}
\value{
A list containing three values: code, bbox and tight. 'code' is a
character vector that contains the SVG code. 'bbox' (a vector of
four elements x1, y1, x2, y2) indicates the position of the top
left corner (first two elements), and the bottom right corner
(last two elements) of the bounding box, when using the default
SVG coordinate system with left-to-right horizontal and up-to-down
vertical axes. 'tight' is the bounding box of the map without labels.
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
\code{\link{nroKoho}} for details on the SOM and \code{\link[grDevices]{rgb}} for details colors
}
\examples{
# Set map unit values for a map of 66 units.
uv <- sample.int(101, size=66, replace=TRUE)

# Create the SOM topology for a map of radius 4 with 66 units.
sm <- nroKoho(matrix(1:16, nrow = 4, ncol = 4),
  radius = 4)

# Find hexadecimal color codings.
colorDef <- nroColorize(uv)

# Define Labels.
myLabels <- nroLabel(map = sm, values = uv)

# Create the SVG output.
svg <- nroCircus(map = sm, colors = colorDef, 
  labels = myLabels, title = "Example")
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ SOM }
%\keyword{ Analysis }% __ONLY ONE__ keyword per line
