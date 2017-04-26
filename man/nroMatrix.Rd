\name{nroMatrix}
\alias{nroMatrix}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Data Input
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Import a data matrix from a tab-delimited text file.
}
\usage{
nroMatrix(fileName, vars, keyVars)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{fileName}{
Path to the file to be imported.
}
  \item{vars}{
Headings of columns to be imported (optional)
}
  \item{keyVars}{
Headings of columns that contain row identity info (optional)
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
The first row of the text file must contain the column headings. If 'vars' is unavailable, all columns in the file will be selected. If 'keyVars' is unavailable, the row ranks in the file are used as identities. If 'keyVars' contains multiple columns, the identity key for a row will be a tab-delimited composite of the corresponding elements.
}
\value{
A numerical matrix with column headings copied from the file and row names constructed from identity columns if available. 
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
# Load the tab-delimited dataset.
# The INDEX column contains the key
fileName <- system.file("extdata", "finndiane_dataset.txt", package = "Numero")

# Load all columns.
dat <- nroMatrix(fileName)
print(summary(dat))

# Load all columns except key column(s).
dat <- nroMatrix(fileName, keyvars = "INDEX")
print(summary(dat))

# Load specific columns only.
dat <- nroMatrix(fileName, vars = c('AGE','MALE'))
print(summary(dat))
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ SOM }
%\keyword{ Analysis }% __ONLY ONE__ keyword per line
