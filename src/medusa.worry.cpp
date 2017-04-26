/* Created by Ville-Petteri Makinen 2003-2010
   Copyright (C) V-P Makinen
   All rights reserved */

#include "medusa.local.h"

/*
 * Print a warning message.
 */
void
medusa::worry(const string& msg, const char* fname) {
  mdsize len = msg.size();
  if(len < 1) return;

  /* Remove path from file name. */
  char* ptr = strrchr((char*)fname, '/');
  if(ptr == NULL) ptr = strrchr((char*)fname, '\\');
  if(ptr == NULL) ptr = (char*)fname;
  else ptr++;

  /* Show messages. */
  if(strlen(fname) == 0) fprintf(stdout, "\rWARNING! %s ", msg.c_str());
  else fprintf(stdout, "\rWARNING! %s: %s ", ptr, msg.c_str());
  if(msg[len-1] != '\n') fprintf(stdout, "\n");
}
