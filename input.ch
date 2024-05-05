Ensure that text input is in UTF-8.

@x
@h
@y
#include <errno.h>
@h
@z

@x
{ if ((f->f=fopen(name_of_file+1,"r"))!=NULL) f->d=fgetwc(f->f); return reset_OK(*f);
@y
{ if ((f->f=fopen(name_of_file+1,"r"))!=NULL) f->d=fgetwc(f->f),
    assert(!ferror(f->f) || errno != EILSEQ);
  return reset_OK(*f);
@z

@x
if (bypass_eoln) if (!eof(*f)) f->d=fgetwc(f->f);
@y
if (bypass_eoln) if (!eof(*f)) f->d=fgetwc(f->f),
  assert(!ferror(f->f));
@z

@x
    buffer[last]=xord[(*f).d];f->d=fgetwc(f->f);incr(last);
@y
    assert(f->d < 65536);
    buffer[last]=xord[(*f).d];f->d=fgetwc(f->f);
    assert(!ferror((*f).f));
    incr(last);
@z
