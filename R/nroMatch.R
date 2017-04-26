nroMatch <- function( som, x ) {

  # Check input types.
  if( is.list( som ) == FALSE ) {
      stop( "'som' must be a list." )
  }
  if( is.null( som$centroids ) == TRUE ) {
      stop( "'som' must contain 'centroids'." )
  }
  if( is.matrix( x ) == FALSE ) {
      stop( "'x' must be a matrix." )
  }

  # Check dataset compatibility.
  Mprof <- nrow( som$centroids );
  Nprof <- ncol( som$centroids );
  Mx <- nrow( x );
  Nx <- ncol( x );
  if( Nx != Nprof ){ 
    stop( "Incompatible columns." ); 
  }
  if( Mx * Nx < 1 ){ 
    stop( "'x' is empty." );
  }

  # Create a temporary topology so that the matching
  # function in the SOM library can be used.
  topology <- matrix(0.0, nrow=Mprof, ncol=6)
  if(is.null(som[["topology"]])) {
      topology[1:Mprof, 1] <- 0.5*(1:Mprof)
      topology[1:Mprof, 2] <- (1:Mprof)
      topology[1:Mprof, 3] <- 0.5*(1:Mprof)
      topology[1:Mprof, 4] <- (1:Mprof)
      topology[1:Mprof, 5] <- 0.5*(1:Mprof)
      topology[1:Mprof, 6] <- (1:Mprof)
  }
  else {
      topology <- som$topology
  }
  
  # Check that column names match.
  datnames <- colnames(x)
  somnames <- colnames(som$centroids)
  if( length( datnames ) != length( somnames) )
      stop( "Incompatible SOM and data columns." ); 
  if( sum( datnames != somnames ) > 0 )
      stop( "Incompatible SOM and data columns." ); 

  # Find best-matching units.
  results <- .Call( "nro_match", topology, som$centroids,
                   x, PACKAGE="Numero" )
  if( class( results ) == "character" ) {
      stop( results )
  }
  if ( nrow( results ) != Mx ) {
      stop( "Matching failed." ) 
  }

  # Check if training history is available.
  delta <- NA
  if(is.null(som$history) == FALSE) {
      delta <- som$history[length(som$history)]      
  }
      
  # Quality compared with the average matching error after training.
  results[,2] <- 2*delta/(delta + results[,2])

  # Proportion of available data.
  results[,3] <- results[, 3] / ncol( x )
  
  # Set row and column names.
  rownames( results ) <- rownames( x )
  colnames( results ) <- c("BMU", "QUALITY", "RDATA")
  return( data.frame( results ) )
}
