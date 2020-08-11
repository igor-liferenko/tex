@x
@h
@y
#include <unistd.h>
@h
@z

@x
{@+if(((*f).f=fopen(name_of_file+1,"r"))!=NULL)(*f).d=fgetwc((*f).f);return reset_OK((*f));
@y
{
  if (((*f).f=fopen(name_of_file+1,"r"))!=NULL) {
    (*f).d=fgetwc((*f).f);
    if (ferror((*f).f) || (*f).d > 65535) { kill(getpid(), SIGABRT); pause(); }
  }
  return reset_OK((*f));
@z

@x
if (bypass_eoln) if (!eof((*f))) (*f).d=fgetwc((*f).f);
@y
if (bypass_eoln) if (!eof((*f))) {
  (*f).d=fgetwc((*f).f);
  if (ferror((*f).f) || (*f).d > 65535) { kill(getpid(), SIGABRT); pause(); }
}
@z

@x
    buffer[last]=xord[(*f).d];(*f).d=fgetwc((*f).f);incr(last);
@y
    buffer[last]=xord[(*f).d];
    (*f).d=fgetwc((*f).f);
    if (ferror((*f).f) || (*f).d > 65535) { kill(getpid(), SIGABRT); pause(); }
    incr(last);
@z
