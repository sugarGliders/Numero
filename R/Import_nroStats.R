#STATS  Calculate basic statistics.
#   [MU, MED, SIGMA, KAPPA, ETA] = STATS(X)
#   X     M x N data matrix, where M is the number
#         of samples and N the number of variables.
#   MU    1 x N vector of means.
#   MED   1 x N vector of medians.
#   SIGMA 1 x N vector of standard deviations.
#   KAPPA 1 x N vector of skewness estimates.
#   ETA   1 x N vector of numbers of valid values.
#
#   Created by Ville-Petteri Makinen 2008

privateStats <- function( x ){
    # Check inputs.
    N <- length( x );
    if( N < 1 ) return(NA)

    # Compute mean, median and standard deviation.
    mu = NaN;
    med = NaN;
    sigma = NaN;
    kappa = NaN;
    eta = NaN;

    mask = which(0*x == 0);
    n = length(mask); 
    eta = n;
    if( n < 1 ) return( c(mu, med, sigma, kappa, eta) )
    xj = x[mask];

    # Mean.
    mu = mean(xj);

    # Median.
    med = median(xj);
  
    if( n < 2 ) return( c(mu, med, sigma, kappa, eta) );
  
    # Standard deviation. 
    sigma = sd(xj);
    if( n < 3 ) return( c(mu, med, sigma, kappa, eta) );

    # Skewness.
    #kappa(j) = skewness(xj);

    return( c(mu, med, sigma, kappa, eta) )
}