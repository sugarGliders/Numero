\name{nroColorize}
\alias{nroColorize}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Map Visualization
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Assign colors to map units based on the respective unit values.
}
\usage{
nroColorize(values, amplitude = 1, palette = "rhodo" )
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{values}{
A numerical vector of unit values.
  }
  \item{amplitude}{
Available proportion of color range.
  }
  \item{palette}{
A sorted string vector of colors, see rgb() for additional details.
The input can also be the name of the colormap, see below.    
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
The argument 'amplitude' controls the part of the color range that is
available for the unit value range. For proportions below 1, the
minimum unit value is assigned to a color that is between the first
and middle element in the color palette, and the maximum is assigned
to a color that is between the middle and the last element. If
'amplitude' is greater than 1, the extreme low and high values are
clipped to the first and last color in the palette, respectively.

Palette can also contain the name of a colormap: 'gray', 'fire',
'jungle', 'miami', 'rhodo' or 'tan'. Any other word will revert
to a rainbow colormap.
}
\value{
An character vector of color definitions.
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
%Nothing here.
%}
\examples{
# Set random unit values.
uv <- sample.int(101, size=100, replace=TRUE)

# Find hexadecimal color codings.
colorDef <- nroColorize(uv)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ SOM }
%\keyword{ Analysis }% __ONLY ONE__ keyword per line
