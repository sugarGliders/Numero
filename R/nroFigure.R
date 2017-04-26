nroFigure <- function( file, scene ) {
  if( is.list( scene ) == FALSE ) {
      stop( "'scene' must be a list." )
  }  
  results <- .Call( "nro_figure", file, scene$svg, scene$bbox,
                   PACKAGE = "Numero" )  
  if( results < 1 ) {
      stop( 'Cannot save figure.' )
  }
  return( results )
}
