\name{nroPermute}
\alias{nroPermute}
\title{
Map Statistcs
}
\description{
Estimate the dynamic range (and statistical significance) for a
regional pattern on a two-dimensional map using permutations.
}
\usage{
nroPermute(map, bmus, x, n = 10000)
}
\arguments{
  \item{map}{
A list that must contain the element 'topology',
see  \code{\link{nroKoho}} for details.
  }
  \item{bmus}{
A numeric vector of M best matching unit labels,
see  \code{\link{nroMatch}} for details.  
  }
  \item{x}{
A numeric vector of M values.
  }
  \item{n}{
Maximum number of permutations. If NA, a limited number of permutations
is performed without estimating statistical significance.
  }
}
\details{
}
\value{
  A data frame with one row and five columns: P is a parametric estimate
  for statistcal significance. FREQ is the frequency-based estimate for
  statistical signicance, Z is the estimated z-score of how far the
  observed map plane is from the average randomly generated layout,
  NDATA indicates how many data values were used, and NSIM tells the
  number of completed permutations.
}
\author{
Song Gao

Stefan Mutter

Ville-Petteri Makinen
}
\seealso{
\code{\link{nroKoho}} for details on the SOM and \code{\link{nroMatch}} for details on the best matching unit labels 
}
\examples{
# Create a data vector.
dat = c(101:164)

# Create the SOM topology.
sm <- nroKoho(matrix(1:16, nrow = 4, ncol = 4), 
  radius = 4)

# Permute labels for the data vector using 10 permutations.
stats <- nroPermute(map = sm, bmus = c(1:64), x = dat, n = 10)
}