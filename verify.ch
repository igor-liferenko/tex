Ensure that input consists only of BMP characters and is valid UTF-8.

@x
{ (*f).f=fopen(name_of_file+1,"r"); if ((*f).f) (*f).d=fgetwc((*f).f); else return false; if (ferror((*f).f)) return false; else return true;
@y
{ (*f).f=fopen(name_of_file+1,"r");
  if ((*f).f)
    assert(((*f).d=fgetwc((*f).f)) <= 65535 && !ferror((*f).f));
  else
    return false;
  return true;
@z

@x
if (bypass_eoln) if (!eof((*f))) (*f).d=fgetwc((*f).f);
@y
if (bypass_eoln) if (!eof(*f))
  assert(((*f).d=fgetwc((*f).f)) <= 65535 && !ferror((*f).f));
@z

@x
    buffer[last]=xord[(*f).d];(*f).d=fgetwc((*f).f);incr(last);
@y
    buffer[last]=xord[(*f).d];
    assert(((*f).d=fgetwc((*f).f)) <= 65535 && !ferror((*f).f));
    incr(last);
@z
