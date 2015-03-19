#include "commonFunction.h"

// convert integer to string
string itos( int i ){
  string result;
	stringstream buf;
	buf<<i;
	buf>>result;
	buf.clear();
	return result;
}
