Ensure that text input is valid UTF-8, consisting only of BMP characters.

@x
@h
@y
#include <errno.h>
@h
@z

@x
{ if ((f->f=fopen(name_of_file+1,"r"))!=NULL) f->d=fgetwc(f->f); return reset_OK(*f);
@y
{ if ((f->f=fopen(name_of_file+1,"r"))!=NULL) {
    f->d=fgetwc(f->f);
    if (!feof(f->f) && (!ferror(f->f) || errno == EILSEQ)) assert(!ferror(f->f) && f->d <= 65535);
  }
  return reset_OK(*f);
@z

@x
if (bypass_eoln) if (!eof(*f)) f->d=fgetwc(f->f);
@y
if (bypass_eoln) if (!eof(*f)) {
  f->d=fgetwc(f->f);
  if (!feof(f->f) && (!ferror(f->f) || errno == EILSEQ)) assert(!ferror(f->f) && f->d <= 65535);
}
@z

@x
    buffer[last]=xord[(*f).d];f->d=fgetwc(f->f);incr(last);
@y
    buffer[last]=xord[(*f).d];
    f->d=fgetwc(f->f);
    if (!feof(f->f) && (!ferror(f->f) || errno == EILSEQ)) assert(!ferror(f->f) && f->d <= 65535);
    incr(last);
@z
