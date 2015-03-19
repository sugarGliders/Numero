#CONDENSE  List rows and columns with sufficient data.
#   [ROWS, COLS] = CONDENSE(X, EPSI, RHO)
#   X     M x N data matrix, where M is the number of samples and N
#         the number of variables.
#   EPSI  Max allowed fraction of missing per row (optional).
#   RHO   Max allowed fraction of missing per column (optional).
#   ROWS  Column vector of row indices.
#   COLS  Row vector of column indices.
#
#   Empty columns are removed before the row occupancy is estimated.
#
#   Copyright (C) 2008 Ville-Petteri Makinen
#   This function is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; see the license file for details.

privateCondense <- function( x, epsi, rho ){
    rows = c(); cols = c();
    if( nargs() < 2 )  epsi = 1.0;
    if( nargs() < 3 )  rho = 1.0;

    epsi = min( 1, max( 0, epsi[ 1 ]) ) ;
    rho = min( 1, max( 0, rho[ 1 ] ) );

    # Convert to logicals.
    b = (0*x == 0);

    # Count values by column.
    mlimit = (1 - rho) * (nrow(b) - 0.5);
    cols = which( colSums(b, na.rm=TRUE) > mlimit);
    b = b[, cols];

    # Count values by row.
    nlimit = (1 - epsi)*(ncol(b) - 0.5);
    rows = which( rowSums(b, na.rm=TRUE) > nlimit);
    return( list(rows, cols) );
}