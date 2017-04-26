/* Created by Ville-Petteri Makinen 2003-2010
   Copyright (C) V-P Makinen
   All rights reserved */

#include "akkad.local.h"

#define PRINTGAP 3.0
#define MAX_ALERT_COUNT 500

/*
 *
 */
class StdMessenger : public NullMessenger {
private:
  char eol;
  mdsize wheel;
  mdsize alertcount;
  mdreal previous;
  unsigned long nbytes;
  time_t stamp;
private:
  mdsize alertExec(FILE*, const string&, const string&);
public:
  void init();
  mdsize alert(const string&);
  mdsize print(const string&);
  mdsize progress(const mdreal);
  mdsize report(const string&);
  mdsize warn(const string&);
  unsigned long size() const;
};

static StdMessenger GlobalMsg;

/*
 *
 */
Messenger*
Messenger::standard() {
  GlobalMsg.init();
  return &GlobalMsg;
}

/*
 *
 */
mdsize
StdMessenger::alert(const string& s) {
  if(alertcount >= MAX_ALERT_COUNT)
    medusa::panic("Max alert count exceeded.", __FILE__, __LINE__);
  this->alertcount += 1;
  return alertExec(stderr, s, "ERROR! ");
}

/*
 *
 */
mdsize
StdMessenger::alertExec(FILE* fid, const string& txt,
			const string& prefix) {
  mdsize n = 0;
  mdsize len = txt.size();
  if(len < 1) return 0;
  if(eol != '\n') n += fprintf(fid, "\n");
  n += fprintf(fid, "%s", (prefix + txt).c_str());
  if(txt[len-1] != '\n') n += fprintf(fid, "\n");
  this->eol = '\n';
  this->nbytes += n;
  fflush(fid);
  return n;
}

/*
 *
 */
void
StdMessenger::init() {
  this->eol = '\n';
  this->wheel = 0;
  this->alertcount = 0;
  this->nbytes = 0;
  this->previous = 0.0;
  this->stamp = time(NULL);
}

/*
 *
 */
mdsize
StdMessenger::print(const string& s) {
  mdsize len = s.size();
  if(len < 1) return 0;
  mdsize n = fprintf(stdout, "%s", s.c_str());
  this->eol = s[len-1];
  fflush(stdout);
  this->stamp = time(NULL);
  this->nbytes += n;
  return n;
}

/*
 *
 */
mdsize
StdMessenger::progress(const mdreal r0) {

  /* Use previous value if input is invalid. */
  double r = r0;
  if(r < 0.0) r = previous;
  if(r > 1.0) r = previous;
  this->previous = r;
  
  /* Message text. */
  if(difftime(time(NULL), stamp) < PRINTGAP) return 0;
  string s = ("\r? " + long2string(100*r) + "% ");
  
  /* Update activity wheel. */
  this->wheel = (wheel + 1)%4;
  switch(wheel) {
  case 0: s[1] = '|'; break;
  case 1: s[1] = '/'; break;
  case 2: s[1] = '-'; break;
  case 3: s[1] = '\\'; break;
  }

  /* Show message. */
  return this->print(s);
}

/*
 *
 */
mdsize
StdMessenger::report(const string& s) {
  if(difftime(time(NULL), stamp) < PRINTGAP) return 0;
  return this->print(s);
}

/*
 *
 */
unsigned long
StdMessenger::size() const {
  return nbytes;
}

/*
 *
 */
mdsize
StdMessenger::warn(const string& s) {
  return alertExec(stdout, s, "Warning! ");
}
