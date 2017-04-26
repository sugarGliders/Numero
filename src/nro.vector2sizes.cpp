/* file: */

#include "nro.h"

/*
 *
 */
vector<mdsize>
nro::vector2sizes( const SEXP& data ) {  
  mdsize sznan = medusa::snan();
  vector<mdsize> array;
  NumericVector values = as<NumericVector>( data );
  for(mdsize i = 0; i < values.length(); i++) {
    if( NumericVector::is_na( values[ i ] ) )
      array.push_back( sznan );
    else
      array.push_back( (mdsize)(values[ i ] + 0.5) );
  }
  return array;
}
