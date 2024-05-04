Ensure that text input files are in UTF-8.

@x
{ if ((f->f=fopen(name_of_file+1,"r"))!=NULL) f->d=fgetwc(f->f); return reset_OK(*f);
@y
{ if ((f->f=fopen(name_of_file+1,"r"))!=NULL) {
    while (fgetwc(f->f) != WEOF) { }
    assert(feof(f->f));
    rewind(f->f);
    f->d=fgetwc(f->f);
  }
  return reset_OK(*f);
@z
