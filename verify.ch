Ensure that text input is valid UTF-8 and codepoints fit into 16 bits.

@x
@h
@y
#include <iconv.h>
@h
@z

@x
{ if ((f->f=fopen(name_of_file+1,"r"))!=NULL) f->d=fgetwc(f->f); return reset_OK(*f);
@y
{ // TODO: use iconv -f UTF-8 -t UCS-2
  if ((f->f=fopen(name_of_file+1,"r"))!=NULL) f->d=fgetwc(f->f); return reset_OK(*f);
@z
