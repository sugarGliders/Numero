/* file: */

#include "nro.h"

static string nro_matrix_exec(vector<vector<mdreal> >&, vector<string>&,
			      vector<string>&, const string&,
			      const vector<string>&);

/*
 *
 */
RcppExport SEXP
nro_matrix( SEXP fileName_R, SEXP vars_R, SEXP kvars_R, SEXP keyFb_R ) {
  string fname = as<string>( fileName_R );
  vector<string> vars = as<vector<string> >( vars_R );
  vector<string> keyvars = as<vector<string> >( kvars_R );
  string keyback = as<string>( keyFb_R );

  /* Check if vars or kvars is empty. */
  if( (vars.size() == 1) && (vars.at( 0 ) == "") ) vars.clear();
  if( (keyvars.size() == 1) && (keyvars.at( 0 ) == "") ) keyvars.clear();

  /* Read data from the file. */
  vector<string> keys;
  vector<vector<mdreal> > data;
  string err = nro_matrix_exec( data, keys, vars, fname, keyvars );
  if(err.size() > 0) return CharacterVector( err );

  /* Return results. */
  NumericMatrix mtx = nro::reals2matrix( data );
  return List::create( mtx, keys, vars, keyvars );
}

/*
 *
 */
string
nro_matrix_exec( vector<vector<mdreal> >& data, vector<string>& keys,
		 vector<string>& vars, const string& fname, 
		 const vector<string>& keyvars ) {
  mdreal rlnan = medusa::rnan();
  data.clear(); keys.clear();
  
  /* Open file. */
  File f; f.open(fname, "r");
  if(f.error().size() > 0) return f.error();
  
  /* Import headings. */
  map<string, mdsize> head2col;
  vector<string> headings = f.read('\t', 0);
  for(mdsize j = 0; j < headings.size(); j++) {
    string& head = headings[j];
    if(head2col.count(head) > 0) continue;
    if(head.size() > 0) {
      head2col[head] = j;
      continue;
    }
    return ( "Empty heading in " + fname + "\n" );
  }

  /* Check if duplicate headings. */
  if(head2col.size() != headings.size())
    return ( "Duplicate headings in " + fname + "\n" );
  
  /* Set selection mask. */
  vector<mdsize> cols;
  if(vars.size() < 1) vars = headings;
  for(mdsize j = 0; j < vars.size(); j++) {
    string& name = vars[j];
    if(head2col.count(name) < 1) continue;
    vars[cols.size()] = name;
    cols.push_back(head2col[name]);
  }

  /* Check if any usable variables. */
  vars.resize(cols.size());
  if(vars.size() < 1) return ( "No usable data in " + fname + "\n" );

  /* Set identity mask. */
  vector<mdsize> keycols;
  for(mdsize j = 0; j < keyvars.size(); j++) {
    const string& name = keyvars[j];
    if(head2col.count(name) > 0) {
      keycols.push_back(head2col[name]);
      continue;
    }

    /* All key columns must be available. */
    return ( "Insufficient identity data in " + fname + "\n" );
  }

  /* Collect data values. */
  for(unsigned long nlines = 1; f.error().size() < 1; nlines++) {
    vector<mdreal> values(cols.size(), rlnan);
    vector<string> fields = f.read('\t', 0);
    mdsize nfields = fields.size();
    if(nfields < 1) continue;
    
    /* Create identity. */
    string key;
    for(mdsize k = 0; k < keycols.size(); k++) {
      mdsize ind = keycols[k];
      if(ind < nfields) {
	if(fields[ind].size() > 0) {
	  key += (fields[ind] + "\t");
	  continue;
	}
      }

      /* All key segments must be non-empty. */
      return ( "Unusable identity in " + fname + "\n" );
    }   
    
    /* Default identity. */
    mdsize len = key.size();
    if(len < 1) key = long2string(nlines);
    else key.resize(len - 1); /* trailing delimiter */
    
    /* Copy row vector. */
    for(mdsize k = 0; k < cols.size(); k++) {
      mdsize ind = cols[k];
      if(ind >= nfields) continue;
      values[k] = string2real(fields[ind]);
    }
    
    /* Update dataset. */
    data.push_back(values);
    keys.push_back(key);
  }
  return "";
}
