Ensure that text input is valid UTF-8 and codepoints fit into 16 bits.

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
    assert(!(ferror(f->f) && errno == EILSEQ));
    if (!ferror(f->f) && !feof(f->f)) assert((f->d & 0xffff) == f->d);
  }
  return reset_OK(*f);
@z

@x
if (bypass_eoln) if (!eof(*f)) f->d=fgetwc(f->f);
@y
if (bypass_eoln) if (!eof(*f)) {
  f->d=fgetwc(f->f);
  assert(!ferror(f->f));
  if (!feof(f->f)) assert((f->d & 0xffff) == f->d);
}
@z

@x
    buffer[last]=xord[(*f).d];f->d=fgetwc(f->f);incr(last);
@y
    buffer[last]=xord[(*f).d];
    f->d=fgetwc(f->f);
    assert(!ferror(f->f));
    if (!feof(f->f)) assert((f->d & 0xffff) == f->d);
    incr(last);
@z
