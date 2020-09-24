Ensure that input consists only of BMP characters and is valid UTF-8.

@x
@h
@y
#include <unistd.h>
@h
@z

@x
{@+if(((*f).f=fopen(name_of_file+1,"r"))!=NULL)(*f).d=fgetwc((*f).f);return reset_OK((*f));
@y
{@+if(((*f).f=fopen(name_of_file+1,"r"))!=NULL)
  if (((*f).d=fgetwc((*f).f)) > 65535 || ferror((*f).f)) kill(getpid(), SIGABRT), pause();
  return reset_OK((*f));
@z

@x
if (bypass_eoln) if (!eof((*f))) (*f).d=fgetwc((*f).f);
@y
if (bypass_eoln) if (!eof((*f)))
  if (((*f).d=fgetwc((*f).f)) > 65535 || ferror((*f).f)) kill(getpid(), SIGABRT), pause();
@z

@x
    buffer[last]=xord[(*f).d];(*f).d=fgetwc((*f).f);incr(last);
@y
    buffer[last]=xord[(*f).d];
    if (((*f).d=fgetwc((*f).f)) > 65535 || ferror((*f).f)) kill(getpid(), SIGABRT), pause();
    incr(last);
@z
