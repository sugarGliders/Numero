\name{nroImportFile}
\alias{nroImportFile}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Import File
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Import selected data from file, given interested column names and identity column names. The function will return a matrix, with row names as identity columns.
}
\usage{
nroImportFile(fileName, vars, kvars)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{fileName}{
The name of imported file
}
  \item{vars}{
The interested column names (optional)
}
  \item{kvars}{
The identity column names (optional)
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
If vars is not specified, all columns in the file will be selected. If kvars is not specified, the number of rows will be used as identity. 
}
\value{
A matrix containing selected columns will be returned, with identity columns (or the number of rows) as row names.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Song Gao
Stefan Mutter
Ville-Petteri Makinen
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

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

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ SOM }
\keyword{ Analysis }% __ONLY ONE__ keyword per line
