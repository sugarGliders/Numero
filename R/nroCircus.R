nroCircus <- function( map, colors, labels=character(), title="" ){

  # Check input types.
  if( is.list( map ) == FALSE ) {
      stop( "'map' must be a list." )
  }
  if( is.vector( colors ) == FALSE ) {
      stop( "'colors' must be a vector." )
  }
  if( is.vector( labels ) == FALSE ) {
      stop( "'labels' must be a vector." )
  }

  # Default labels.
  if( length(labels) < 1 ) {
      labels <- rep( "", length(colors) )
  }
  
  # Check input sizes.
  if( length(colors) != length(labels) ) {
      stop( "Incompatible inputs." )
  }
  
  # Generate SVG code.
  results <- .Call( "nro_circus", map$topology, colors, labels, title,
                   PACKAGE = "Numero" );
  if( class( results ) == "character" ) {
      stop( results );
  }
  
  # Return results.
  obj <- list(svg=results[[ 1 ]],
              bbox=results[[ 2 ]],
              tight=results[[ 3 ]] )
  return( obj )
}
