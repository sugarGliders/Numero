/* Created by Ville-Petteri Makinen 2003-2010
   Copyright (C) V-P Makinen
   All rights reserved */

#include "medusa.local.h"

/*
 *
 */
void
medusa::panic(const string& msg, const char* fname, const int lnum) {
  mdsize len = msg.size();
  if(len > 0) {

    /* Remove path from file name. */
    char* ptr = strrchr((char*)fname, '/');
    if(ptr == NULL) ptr = strrchr((char*)fname, '\\');
    if(ptr == NULL) ptr = (char*)fname;
    else ptr++;

    /* Show message. */
    fprintf(stderr, "\rERROR! %s at line %d: %s",
	    ptr, lnum, msg.c_str());
    if(msg[len-1] != '\n') fprintf(stderr, "\n");
  }
  exit(1);
}
