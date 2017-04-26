/* Created by Ville-Petteri Makinen 2003-2010
   Copyright (C) V-P Makinen */

#include "scriptum.local.h"

/*
 *
 */
Color::Color() {
  this->red = 1.0;
  this->green = 1.0;
  this->blue = 1.0;
  this->opacity = 0.0;
}

/*
 *
 */
Color::Color(const string& txt) {

  /* Check if the first charater is a hashtag. */
  mdsize offset = 0;
  if(txt.size() > 0)
    offset = (txt[0] == '#');

  /* Unusable input. */
  if(txt.size() < (6 + offset)) {
    this->red = 1.0;
    this->green = 1.0;
    this->blue = 1.0;
    this->opacity = 0.0;
    return;
  }

  /* Valid color. */
  string sR = ("0x" + txt.substr(offset, 2));
  string sG = ("0x" + txt.substr((offset + 2), 2));
  string sB = ("0x" + txt.substr((offset + 4), 2));
  this->red = atof(sR.c_str())/255.0;
  this->green = atof(sG.c_str())/255.0;
  this->blue = atof(sB.c_str())/255.0;

  /* Opacity info. */
  if(txt.size() < (8 + offset)) this->opacity = 1.0;
  else {
    string sO = ("0x" + txt.substr((offset + 6), 2));
    this->opacity = atof(sO.c_str())/255.0;
  }
}

/*
 *
 */
Color::~Color() {}

/*
 *
 */
mdreal
Color::contrast(const Color& c) const {
  
  /* Brightness. */
  double brightA = (0.3*red + 0.5*green + 0.1*blue);
  double brightB = (0.3*c.red + 0.5*c.green + 0.1*c.blue);
  
  /* Extremes. */
  double rmin = red; if(rmin > c.red) rmin = c.red;
  double rmax = red; if(rmax < c.red) rmax = c.red;
  double gmin = green; if(gmin > c.green) gmin = c.green;
  double gmax = green; if(gmax < c.green) gmax = c.green;
  double bmin = blue; if(bmin > c.blue) bmin = c.blue;
  double bmax = blue; if(bmax < c.blue) bmax = c.blue;
  
  /* Color difference. */
  double delta = (rmax - rmin + gmax - gmin + bmax - bmin);
  return (brightB - brightA)*delta;
}

/*
 *
 */
string
Color::hex() const {
  char buf[16];
  int r = (int)(255*red + 0.5);
  int g = (int)(255*green + 0.5);
  int b = (int)(255*blue + 0.5);
  int a = (int)(255*opacity + 0.5);
  if(r < 0) r = 0; if(r > 255) r = 255;
  if(g < 0) g = 0; if(g > 255) g = 255;
  if(b < 0) b = 0; if(b > 255) b = 255;
  if(a < 0) a = 0; if(a > 255) a = 255;
  if(a >= 255) sprintf(buf, "%02x%02x%02x", r, g, b);
  else sprintf(buf, "%02x%02x%02x%02x", r, g, b, a);
  return string(buf);
}
