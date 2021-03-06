/* Created by Ville-Petteri Makinen 2003-2010
   Copyright (C) V-P Makinen */

#include "scriptum.local.h"

/*
 * This function must always return exactly
 * the same number of bytes or zero.
 */
string
ArtistBuffer::prolog(const Color& color) const {
  mdreal rlnan = medusa::rnan();
  char bytes[4090];
  char* p = bytes;

  /* Begin document. */
  p += sprintf(p, "<?xml version=\"1.0\"?>\n");
  p += sprintf(p, "<!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\"\n");
  p += sprintf(p, "\"http://www.w3.org/Graphics/");
  p += sprintf(p, "SVG/1.1/DTD/svg11.dtd\">\n");

  /* Check limits. */
  mdreal xmin = limits.first.alpha;
  mdreal xmax = limits.first.omega;
  mdreal ymin = limits.second.alpha;
  mdreal ymax = limits.second.omega;
  if(xmin == rlnan) xmin = 0.0;
  if(xmax == rlnan) xmax = 0.0;
  if(ymin == rlnan) ymin = 0.0;
  if(ymax == rlnan) ymax = 0.0;

  /* Extract canvas size. */
  long width = (long)(xmax - xmin + 0.5);
  long height = (long)(ymax - ymin + 0.5);

  /* Set size. */
  p += sprintf(p, "\n<svg xmlns=\"http://www.w3.org/2000/svg\"\n");
  p += sprintf(p, "x=\"0\" y=\"0\" ");
  p += sprintf(p, "width=\"%06ld\" ", width); /* fixed byte count  */
  p += sprintf(p, "height=\"%06ld\">\n", height);

  /* Add background. */
  p += sprintf(p, "\n<polygon points=\"");
  p += sprintf(p, "\n\t0,0\n\t%06ld,0", width);
  p += sprintf(p, "\n\t%06ld,%06ld", width, height);
  p += sprintf(p, "\n\t0,%06ld\"", height);
  p += sprintf(p, "\nstyle=\"fill: ");
  p += sprintf(p, "#%s;\"\n/>\n", color.hex().substr(0, 6).c_str());
  
  /* Determine offset. */
  long dx = (long)(fabs(xmin) + 0.5);
  long dy = (long)(fabs(ymin) + 0.5);
  if(xmin > 0.0) dx *= -1;
  if(ymin > 0.0) dy *= -1;

  /* Set origin to zero. */
  p += sprintf(p, "\n<g transform=");
  p += sprintf(p, "\"translate(%06ld, ", dx);
  p += sprintf(p, "%06ld)\">\n", dy);
  return string(bytes);
}
