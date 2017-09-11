nroKmeans <- function( x, k = 3 ){
  if( is.matrix( x ) == FALSE ) {
      stop( "'x' must be a matrix." )
  }
  
  # Check dataset.
  m <- nrow( x )
  n <- ncol( x )
  if( m < 10 ) { 
      stop( "Too few data." )
  }
  
  # Check number of centroids.
  if( k > m/2 ) { 
      stop( "Too many centroids." )
  }
  if( k < 2 ) { 
      stop( "Too few centroids." )
  }

  # Add small jitter to ensure convergence.
  for( j in 1:n ) {
      sigma <- sd(x[,j], na.rm=TRUE)
      jitter <- (((j/n)*m + (1:m))%%m)
      jitter <- (jitter - mean(jitter))
      jitter <- 0.001*sigma*jitter/m
      x[,j] <- (x[,j] + jitter)
  }

  # Estimate centroids.
  results <- .Call( "nro_kmeans", x, k, PACKAGE = "Numero" )
  if( class( results ) == "character" ) {
      stop( results )
  }

  # Recode missing unit labels.
  bmus <- as.integer(results[[ 2 ]])
  bmus[which(bmus == 0)] <- NA
  
  # Collect results.
  res <- list()
  res$centroids <- results[[ 1 ]]
  res$bmus <- as.matrix(bmus)
  res$history <- results[[ 3 ]]
  
  # Copy row and column names.
  rownames( res$bmus ) <- rownames( x )
  colnames( res$bmus ) <- c("BMU")
  colnames( res$centroids ) <- colnames( x )
  return( res )
}
