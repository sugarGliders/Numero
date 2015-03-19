/* Created by Ville-Petteri Makinen 2003-2010
   Copyright (C) V-P Makinen
   All rights reserved */

#ifndef medusa_local_INCLUDED
#define medusa_local_INCLUDED

#define _FILE_OFFSET_BITS 64 /* large file support */
#define IOBUFCAP_medusa 262144

#include <cstdlib>
#include <cstdio>
#include <cstring>
#include <cfloat>
#include <climits>
#include <ctime>
#include <cctype>
#include <cmath>
#include <algorithm>
#include <string>
#include <vector>
#include <unordered_map>
#include <unordered_set>
#include "medusa.hpp"

using namespace std;
using namespace medusa;

extern unordered_map<FILE*, char*> Handle2Buffer;

#endif /* medusa_local_INCLUDED */
