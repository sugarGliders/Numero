\name{Numero3-package}
\alias{Numero3-package}
\alias{Numero3}
\docType{package}
\title{
SOM Analysis
}
\description{
Use SOM to visualize and analyze correlations among multiple features.
}
\details{
\tabular{ll}{
Package: \tab Numero3\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2015-03-11\cr
License: \tab GPL (>= 2)\cr
}
~~ An overview of how to use the package, including the most ~~
~~ important functions ~~
}
\author{
Song Gao
Stefan Mutter
Ville-Petteri Makinen

Maintainer: Song Gao <song.gao@sahmri.com>
}
\references{
~~ Literature or other references for background information ~~
}

\keyword{ SOM }
\seealso{
Nothing here.
}
\examples{
library( Numero3 )
fileName <- system.file( "extdata", "smallDS", package = "Numero3" )
charVector1 <- c( "LIFSPAN", "EGG", "EGGRATE" )
charVector2 <- c( "LIFSPAN", "PROT" )
nroImportFile( fileName, charVector1, charVector2 )
}
