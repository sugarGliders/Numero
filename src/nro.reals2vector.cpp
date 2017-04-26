/* file: */

#include "nro.h"

/*
 *
 */
NumericVector
nro::reals2vector( const vector<mdreal>& values ) {
  mdreal rlnan = medusa::rnan();
  NumericVector array( values.size() );
  for( mdsize i = 0; i < values.size(); i++ ) {
    if( array[ i ] == rlnan )
      array( i ) = NA_REAL;
    else
      array( i ) = values[ i ];
  }
  return array;
}
